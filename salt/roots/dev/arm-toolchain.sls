# Arm toolchain repository
arm-toolchain:
  # Package repository
  pkgrepo.managed:
    - ppa: terry.guo/gcc-arm-embedded
    - require_in:
      - pkg: gcc-arm-none-eabi

gcc-arm-none-eabi:
  pkg.installed

openocd:
   pkg.installed

/etc/udev/rules.d/90-openocd.rules:
    file.managed:
        - source: salt://etc/udev-openocd.rules
        - mode: 644

dfu-util:
   pkg.installed
