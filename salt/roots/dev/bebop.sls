https://github.com/AutonomyLab/bebop_autonomy.git:
    git.latest:
        - rev: indigo-devel
        - target: /home/salah/catkin_ws/src/bebop_autonomy
        - user: salah
        - force_reset: True
        - require:
            - pkg: git
        - require_in:
            - cmd: bebop-ros

# see http://developer.parrot.com/docs/SDK3/#required-external-tools
{% for pkg in [
    "libavahi-client-dev",
    "libavcodec-dev",
    "libavformat-dev",
    "libswscale-dev",
    "libncurses5-dev",
    "mplayer",
] %}
{{ pkg }}:
    pkg.installed:
        - require_in:
            - cmd: bebop-ros
{% endfor %}

# see http://bebop-autonomy.readthedocs.io/en/latest/installation.html
bebop-ros:
    cmd.run:
        - cwd: /home/salah/catkin_ws
        - runas: salah
        - name: |
            rosdep update
            rosdep install --from-paths src -i
            catkin build -DCMAKE_BUILD_TYPE=RelWithDebInfo
