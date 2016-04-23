{% for pkg in [
    "libusb-1.0-0-dev",
    "xorg-dev",
    "libglu1-mesa-dev"
]%}
{{ pkg }}:
    pkg.installed
{% endfor %}

https://github.com/glfw/glfw.git:
    git.latest:
        - rev: latest
        - target: /usr/src/glfw
        - user: root
        - require:
            - pkg: git
        - require_in:
            - pkg: glfw

glfw:
    cmd.run:
        - cwd: /usr/src/glfw
        - user: root
        - name: |
            cmake . -DBUILD_SHARED_LIBS=ON
            make
            make install
            ldconfig

https://github.com/IntelRealSense/librealsense.git:
    git.latest:
        - rev: master
        - target: /usr/src/librealsense
        - user: root
        - require:
            - pkg: git
        - require_in:
            - file: realsense-udev-rules
            - cmd: patch-uvc-video

realsense-udev-rules:
    file.managed:
        - name:  /etc/udev/rules.d/99-realsense-libusb.rules
        - source: /usr/src/librealsense/config/99-realsense-libusb.rules
        - user: salah
        - force: True

patch-uvc-video:
    cmd.run:
        - cwd: /usr/src/librealsense
        - user: root
        - name: |
            /usr/src/librealsense/scripts/patch-uvcvideo-ubuntu-mainline.sh
            modprobe uvcvideo

librealsense:
    cmd.run:
        - cwd: /usr/src/librealsense
        - user: root
        - name: |
            make
            make install
        - require:
            - cmd: patch-uvc-video
