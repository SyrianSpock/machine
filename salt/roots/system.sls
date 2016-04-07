/etc/update-manager/release-upgrades:
    file.managed:
        - source: salt://etc/release-upgrades

ubuntu-desktop:
    pkg.installed


gnome-shell:
    pkg.installed

ubuntu-gnome-desktop:
    pkg.installed

mate-ubuntu-destkop:
    pkg.installed


numix-repo:
    pkgrepo.managed:
        - ppa: numix/ppa

numix-icon-theme-circle:
    pkg.installed:
        - require:
            - pkgrepo: numix-repo

numix-gtk-theme:
    pkg.installed:
        - require:
            - pkgrepo: numix-repo
