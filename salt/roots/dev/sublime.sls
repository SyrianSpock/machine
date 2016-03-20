sublime_text_repo:
    # Package repository
    pkgrepo.managed:
        - ppa: webupd8team/sublime-text-3
        - require_in:
            - pkg: sublime-text-installer

sublime-text-installer:
    pkg.installed
