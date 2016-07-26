gazebo_repo:
    pkgrepo.managed:
        - name: deb http://packages.osrfoundation.org/gazebo/ubuntu-stable trusty main
        - dist: trusty
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
