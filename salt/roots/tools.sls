synapse_repo:
    pkgrepo.managed:
        - ppa: synapse-core/ppa
        - require_in:
            - pkg: synapse

synapse:
    pkg.installed

gimp:
    pkg.installed
