{% for pkg in [
    "libglfw3-dev",
    "libgl1-mesa-dev",
    "libglu1-mesa-dev",
    "libgtk-3-dev",
]%}
{{ pkg }}:
    pkg.installed
{% endfor %}

https://github.com/IntelRealSense/librealsense.git:
    git.latest:
        - rev: master
        - target: /usr/src/librealsense
        - require_in:
            - file: realsense-udev-rules
            - cmd: patch-uvc-video

realsense-udev-rules:
    file.managed:
        - name:  /etc/udev/rules.d/99-realsense-libusb.rules
        - source: /usr/src/librealsense/config/99-realsense-libusb.rules
        - runas: salah
        - force: True
        - require_in:
            - cmd: patch-uvc-video

patch-uvc-video:
    cmd.run:
        - cwd: /usr/src/librealsense
        - name: |
            udevadm control --reload-rules
            udevadm trigger
            /usr/src/librealsense/scripts/patch-realsense-ubuntu-lts.sh
            modprobe uvcvideo

librealsense:
    cmd.run:
        - cwd: /usr/src/librealsense
        - name: |
            mkdir build
            cd build
            cmake ../ -DBUILD_EXAMPLES=true
            make uninstall
            make clean
            make
            make install
        - require:
            - cmd: patch-uvc-video
