{% for pkg in [
    "xmonad",
    "libghc-xmonad-dev",
    "libghc-xmonad-contrib-dev",
    "xmobar",
    "xcompmgr",
    "nitrogen",
    "stalonetray",
    "moreutils",
    "consolekit",
    "ssh-askpass-gnome",
    "thunar",
    "terminator",
    "remmina"
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

xmonad-start-config:
    file.managed:
        - name: /home/salah/.xmonad/start-xmonad
        - source: salt://xmonad/start-xmonad

xmonad-startuphook-config:
    file.managed:
        - name: /home/salah/.xmonad/startup-hook
        - source: salt://xmonad/startup-hook

xmonad-getvolume-config:
    file.managed:
        - name: /home/salah/.xmonad/get-volume
        - source: salt://xmonad/get-volume

xmonad-desktop:
    file.managed:
        - name: /usr/share/xsessions/xmonad.desktop
        - source: salt://xmonad/xmonad.desktop
        - user: root
        - force: True

xmonad-gtk2-config:
    file.managed:
        - name: /home/salah/.gtkrc-2.0
        - source: salt://xmonad/gtkrc-2.0
        - force: True
