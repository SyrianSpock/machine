git:
    pkg.installed

git-config:
    file.managed:
        - name: ~/.gitconfig
        - source: salt://git/config
        - runas: salah
        - force: True
