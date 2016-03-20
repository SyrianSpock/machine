apt-transport-https:
    pkg.installed

ca-certificates:
    pkg.installed

apparmor:
    pkg.installed

docker_repo:
    pkgrepo.managed:
        - name: deb https://apt.dockerproject.org/repo ubuntu-trusty main
        - dist: ubuntu-trusty
        - file: /etc/apt/sources.list.d/docker.list
        - keyid: 58118E89F3A912897C070ADBF76221572C52609D
        - keyserver: hkp://p80.pool.sks-keyservers.net:80
        - require_in:
            - pkg: docker-engine

    cmd.run:
        - name: 'sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D'

docker-engine:
    pkg.installed