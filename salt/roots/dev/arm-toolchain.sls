# Arm toolchain repository
arm-toolchain:
    # Package repository
    pkgrepo.managed:
        - ppa: terry.guo/gcc-arm-embedded
        - require_in:
            - pkg: gcc-arm-none-eabi

gcc-arm-none-eabi:
    pkg.installed

dfu-util:
    pkg.installed

git://git.code.sf.net/p/openocd/code:
    git.latest:
        - rev: master
        - target: /usr/src/openocd
        - user: root
        - require:
            - pkg: git

openocd:
  cmd.run:
    - cwd: /usr/src/openocd
    - user: root
    - name: |
        ./bootstrap
        ./configure --prefix=/usr/local
        make
        make install
    - unless: /usr/local/bin/openocd

/etc/udev/rules.d/90-openocd.rules:
    file.managed:
        - source: salt://etc/udev-openocd.rules
        - mode: 644
