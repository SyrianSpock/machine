/etc/update-manager/release-upgrades:
    file.managed:
        - source: salt://etc/release-upgrades

tlp-repo:
    pkgrepo.managed:
        - ppa: linrunner/tlp

{% for pkg in [
    "tlp",
    "tlp-rdw",
    "tp-smapi-dkms",
    "acpi-call-dkms"
]%}
{{ pkg }}:
    pkg.installed:
        - require:
            - pkgrepo: tlp-repo
{% endfor %}

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
