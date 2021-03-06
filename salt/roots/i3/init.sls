i3:
    pkg.installed

ruby-ronn:
    pkg.installed:
        - require_in:
            - cmd: i3blocks

git://github.com/vivien/i3blocks:
    git.latest:
        - rev: 1.4
        - target: /usr/src/i3blocks
        - user: root
        - force_reset: True
        - require:
            - pkg: git
        - require_in:
            - cmd: i3blocks

i3blocks:
  cmd.run:
    - cwd: /usr/src/i3blocks
    - user: root
    - name: |
        make clean debug
        make install
    - unless: which /usr/local/bin/i3blocks

i3-config:
    file.managed:
        - name: ~/.i3/config
        - makedirs: True
        - source: salt://i3/config
        - runas: salah
        - force: True

i3-background:
    file.managed:
        - name: ~/.i3/Nature.png
        - makedirs: True
        - source: salt://i3/Nature.png
        - runas: salah
        - force: True

i3blocks-config:
    file.managed:
        - name: ~/.i3/i3blocks.conf
        - makedirs: True
        - source: salt://i3/i3blocks.conf
        - runas: salah
        - force: True

# PulseAudio Volume Control GUI
pavucontrol:
    pkg.installed

# System stats (CPU load)
sysstat:
    pkg.installed

# Background setter
feh:
    pkg.installed

libbsd-dev:
    pkg.installed

git://github.com/multiplexd/brightlight:
    git.latest:
        - target: /usr/src/brightlight
        - user: root
        - force_reset: True
        - require:
            - pkg: git
        - require_in:
            - cmd: brightlight

brightlight:
    cmd.run:
        - cwd: /usr/src/brightlight
        - user: root
        - name: |
            make
            chmod +s brightlight
            cp brightlight /usr/local/bin/
        - unless: which /usr/local/bin/brightlight
        - require:
            - pkg: libbsd-dev

brightlight-no-sudo:
    file.append:
        - name: /etc/sudoers
        - text: "username ALL= NOPASSWD: /usr/local/bin/brightlight"

acpi:
    pkg.installed

gogh:
    cmd.run:
        - cwd: /tmp
        - runas: salah
        - name : |
            wget -O gogh https://git.io/vQgMr
            chmod +x gogh
            ./gogh
            rm gogh
        - unless: which gogh
