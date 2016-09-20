gazebo_repo:
    pkgrepo.managed:
        - name: deb http://packages.osrfoundation.org/gazebo/ubuntu-stable xenial main
        - dist: xenial
        - file: /etc/apt/sources.list.d/gazebo-stable.list
        - key_url: http://packages.osrfoundation.org/gazebo.key

    cmd.run:
        - name: 'wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -'
        - unless: 'apt-key list | grep osrfoundation.org/gazebo'

{% for pkg in ["libgazebo7",
               "gazebo7",
               "libgazebo7-dev",
] %}
{{ pkg }}:
    pkg.installed:
        - require:
            - pkgrepo: gazebo_repo
{% endfor %}

gazebo_models:
    cmd.run:
        - name: |
            wget -l 2 -nc -r "http://models.gazebosim.org/" --accept gz
            cd "models.gazebosim.org"
            for i in *
            do
              tar -zvxf "$i/model.tar.gz"
            done
            mkdir -p ~/.gazebo/models/
            cp -vfR * ~/.gazebo/models/
        - runas: salah
        - unless: 'ls  ~/.gazebo/models/'

gazebo_source_setup:
    file.append:
        - name: "/etc/bash.bashrc"
        - text:
            - source /usr/share/gazebo/setup.sh
            - alias killgazebo="killall -9 gazebo & killall -9 gzserver  & killall -9 gzclient"
