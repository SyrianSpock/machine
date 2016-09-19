synapse_repo:
    pkgrepo.managed:
        - ppa: synapse-core/ppa
        - dist: trusty
        - require_in:
            - pkg: synapse

synapse:
    pkg.installed

gimp:
    pkg.installed
