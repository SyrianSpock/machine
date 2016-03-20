synapse_repo:
    pkgrepo.managed:
        - ppa: elementary-os/unstable-upstream
        - require_in:
        - pkg: indicator-synapse

indicator-synapse:
    pkg.installed

gimp:
    pkg.installed