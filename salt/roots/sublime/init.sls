sublime_text_repo:
    # Package repository
    pkgrepo.managed:
        - ppa: webupd8team/sublime-text-3
        - require_in:
            - pkg: sublime-text-installer

sublime-text-installer:
    pkg.installed

sublime-pkg-control:
    cmd.run:
        - name: wget "https://sublime.wbond.net/Package Control.sublime-package"
        - cwd: "/home/salah/.config/sublime-text-3/Installed Packages"
        - user: salah
        - creates: "/home/salah/.config/sublime-text-3/Installed Packages/Package Control.sublime-package"
        - require:
            - pkg: sublime-text-installer

sublime-packages:
    file.managed:
        - name: '~/.config/sublime-text-3/Packages/User/Package Control.sublime-settings'
        - source: salt://sublime/packages
        - user: salah
        - force: True

sublime-config:
    file.managed:
        - name: ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
        - source: salt://sublime/config
        - user: salah
        - force: True

sublime-keybindings:
    file.managed:
        - name: '~/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap'
        - source: salt://sublime/keybindings
        - user: salah
        - force: True
