ros_repo:
    pkgrepo.managed:
        - name: deb http://packages.ros.org/ros/ubuntu trusty main
        - dist: trusty
        - file: /etc/apt/sources.list.d/ros-latest.list
        - key_url: https://raw.githubusercontent.com/ros/rosdistro/master/ros.key

    cmd.run:
        - name: 'wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -'
        - unless: 'apt-key list | grep ros.org'

{% for pkg in ["ros-indigo-desktop-full",
               "python-rosinstall", "python-catkin-tools",
] %}
{{ pkg }}:
    pkg.installed:
        - require:
            - pkgrepo: ros_repo
{% endfor %}

rospkg-python3:
    pip.installed:
        - name: rospkg
        - bin_env: /usr/local/bin/pip3
        - require:
            - cmd: get-pip3

catkin-pkg-python3:
    pip.installed:
        - name: catkin-pkg
        - bin_env: /usr/local/bin/pip3
        - require:
            - cmd: get-pip3

rosdep_init:
    cmd.run:
        - name: "rosdep init"
        - user: root

        # Avoid running rosdep if it was already written once
        - creates: "/etc/ros/rosdep/sources.list.d/20-default.list"

rosdep_update:
    cmd.run:
        - name: "rosdep update"
        - user: salah
        - creates: "~/.ros/rosdep/"

ros_source_setup:
    file.append:
        - name: "/etc/bash.bashrc"
        - text:
            - "source /opt/ros/indigo/setup.bash"
            - "source ~/catkin_ws/devel/setup.bash"

catkin_workspace:
    file.directory:
        - name: "/home/salah/catkin_ws/src"
        - user: salah
        - group: salah
        - makedirs: True

    cmd.run:
        - name: "source /opt/ros/indigo/setup.bash; catkin_init_workspace"
        - user: salah
        - cwd: "/home/salah/catkin_ws/src"
        - creates: "/home/salah/catkin_ws/src/CMakeLists.txt"
        - require:
            - file: catkin_workspace

