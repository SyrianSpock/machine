ruby-ppa:
    pkgrepo.managed:
        - ppa: brightbox/ruby-ng

ruby2.1:
    pkg.installed:
        - require:
            - pkgrepo: ruby-ppa

bundler:
    gem.installed:
        - require:
            - pkg: ruby2.1
