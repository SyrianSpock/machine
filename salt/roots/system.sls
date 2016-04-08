/etc/update-manager/release-upgrades:
    file.managed:
        - source: salt://etc/release-upgrades

ubuntu-desktop:
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

ubuntu-tweak-repo:
    pkgrepo.managed:
        - ppa: tualatrix/ppa

ubuntu-tweak:
    pkg.installed:
        - require:
            - pkgrepo: ubuntu-tweak-repo

mate-repo:
    pkgrepo.managed:
        - ppa: ubuntu-mate-dev/ppa

mate-trusty-repo:
    pkgrepo.managed:
        - ppa: ubuntu-mate-dev/trusty-mate

ubuntu-mate-core:
    pkg.installed:
        - require:
            - pkgrepo: mate-trusty-repo

ubuntu-mate-desktop:
    pkg.installed:
        - require:
            - pkgrepo: mate-trusty-repo
