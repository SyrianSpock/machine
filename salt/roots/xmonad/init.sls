mate-repo:
    pkgrepo.managed:
        - ppa: ubuntu-mate-dev/ppa

mate-dev-repo:
    pkgrepo.managed:
        - ppa: ubuntu-mate-dev/trusty-mate

{% for pkg in [
    "xmonad",
    "libghc-xmonad-dev",
    "libghc-xmonad-contrib-dev",
    "xmobar",
    "ubuntu-mate-core",
    "ubuntu-mate-desktop"
]%}
{{ pkg }}:
    pkg.installed
{% endfor %}

xmonad-config:
    file.managed:
        - name: /home/salah/.xmonad/xmonad.hs
        - source: salt://xmonad/xmonad.hs
        - force: True
        - makedirs: True

xmobar-config:
    file.managed:
        - name: /home/salah/.xmonad/xmobarrc
        - source: salt://xmonad/xmobarrc

xmonad-desktop:
    file.managed:
        - name: /usr/share/xsessions/xmonad.desktop
        - source: salt://xmonad/xmonad.desktop
        - user: root
        - force: True
