virtualbox_repo:
    pkgrepo.managed:
        - name: deb http://download.virtualbox.org/virtualbox/debian trusty contrib
        - dist: trusty
        - file: /etc/apt/sources.list.d/virtualbox.list
        - key_url: http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc

    cmd.run:
        - name: 'wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O - | sudo apt-key add -'
        - unless: 'apt-key list | grep virtualbox.org'

virtualbox-5.0:
    pkg.installed

dkms:
    pkg.installed