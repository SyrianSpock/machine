sublime_text_repo:
    # Package repository
    pkgrepo.managed:
        - name: deb https://download.sublimetext.com/ apt/dev/
        - file: /etc/apt/sources.list.d/sublime-text.list
        - key_url: https://download.sublimetext.com/sublimehq-pub.gpg
    cmd.run:
        - name: 'wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -'
        - unless: 'apt-key list | grep sublime'

sublime-text:
    pkg.installed

sublime-pkg-control:
    cmd.run:
        - name: mkdir -p "/home/salah/.config/sublime-text-3/Installed Packages" && wget "https://sublime.wbond.net/Package Control.sublime-package" --no-check-certificate --force-directories -O "/home/salah/.config/sublime-text-3/Installed Packages/Package Control.sublime-package"
        - runas: salah
        - creates: "/home/salah/.config/sublime-text-3/Installed Packages/Package Control.sublime-package"
        - makedirs: True
        - require:
            - pkg: sublime-text
        - require_in:
            - file: sublime-packages

sublime-packages:
    file.managed:
        - name: '~/.config/sublime-text-3/Packages/User/Package Control.sublime-settings'
        - source: salt://sublime/packages
        - runas: salah
        - force: True
        - makedirs: True

sublime-config:
    file.managed:
        - name: ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
        - source: salt://sublime/config
        - runas: salah
        - force: True
        - makedirs: True

sublime-keybindings:
    file.managed:
        - name: '~/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap'
        - source: salt://sublime/keybindings
        - runas: salah
        - force: True
        - makedirs: True
