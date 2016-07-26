{% for pkg in [
    "libboost-dev",
    "libboost-thread-dev",
    "libboost-filesystem-dev",
    "ffmpeg",
    "libavcodec-dev",
    "libavutil-dev",
    "libavformat-dev",
    "libswscale-dev",
    "libglew-dev",
    "libblas-dev",
    "liblapack-dev"
]%}
{{ pkg }}:
    pkg.installed
{% endfor %}

https://github.com/stevenlovegrove/Pangolin.git:
    git.latest:
        - rev: master
        - target: /usr/src/Pangolin
        - user: root
        - require:
            - pkg: git
        - require_in:
            - pkg: Pangolin

Pangolin:
    cmd.run:
        - cwd: /usr/src/Pangolin
        - user: root
        - name: |
            mkdir build
            cd build
            cmake -DCPP11_NO_BOOST=1 ..
            make -j
            make install


