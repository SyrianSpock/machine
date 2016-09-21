{% for pkg in [
    "libgtk2.0-dev",
    "pkg-config",
    "python-dev",
    "python-numpy",
    "libtbb2",
    "libtbb-dev",
    "libjpeg-dev",
    "libpng-dev",
    "libtiff-dev",
    "libjasper-dev",
    "libdc1394-22-dev"
] %}
{{ pkg }}:
    pkg.installed:
        - require_in:
            - cmd: opencv
{% endfor %}

opencv-core-repo:
    git.latest:
        - name: https://github.com/Itseez/opencv.git
        - rev: master
        - target: /usr/src/opencv
        - user: root
        - force_reset: True

opencv-contrib-repo:
    git.latest:
        - name: https://github.com/Itseez/opencv_contrib.git
        - rev: master
        - target: /usr/src/opencv_contrib
        - user: root
        - force_reset: True

opencv:
    cmd.run:
        - cwd: /usr/src/opencv
        - user: root
        - makedirs: True
        - name: |
            mkdir -p build
            pushd build
            cmake -D CMAKE_BUILD_TYPE=Debug -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_MATLAB=OFF ..
            make -j7
            make install
