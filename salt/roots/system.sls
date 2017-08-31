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
    "acpi"
    "acpi-call-dkms"
]%}
{{ pkg }}:
    pkg.installed:
        - require:
            - pkgrepo: tlp-repo
{% endfor %}
