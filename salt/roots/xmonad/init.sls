xmonad:
    pkg.installed

xmonad-config:
    file.managed:
        - name: ~/.xmonad/xmonad.hs
        - source: salt://xmonad/xmonad.hs
        - user: salah
        - force: True
        - makedirs: True
