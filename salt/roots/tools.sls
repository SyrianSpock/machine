synapse_repo:
    pkgrepo.managed:
        - ppa: elementary-os/unstable-upstream
        - require_in:
            - pkg: synapse

synapse:
    pkg.installed

gimp:
    pkg.installed
