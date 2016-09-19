i3:
    pkg.installed

xbacklight:
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

# Battery stats
acpi:
    pkg.installed

# Background setter
feh:
    pkg.installed
