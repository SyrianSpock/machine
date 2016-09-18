i3:
    pkg.installed

xbacklight:
    pkg.installed

i3-config:
    file.managed:
        - name: ~/.i3/config
        - makedirs: True
        - source: salt://i3/config
        - runas: salah
        - force: True
