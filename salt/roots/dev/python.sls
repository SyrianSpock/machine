get-pip2:
    cmd.run:
        - cwd: /usr/src
        - user: root
        - name: |
            curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
            python2 get-pip.py
        - unless: /usr/local/bin/pip2 --version
        - require:
            - pkg: curl

get-pip3:
    cmd.run:
        - cwd: /usr/src
        - user: root
        - name: |
            curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
            python3 get-pip.py
        - unless: /usr/local/bin/pip3 --version
        - require:
            - pkg: curl
