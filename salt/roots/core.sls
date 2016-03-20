vim:
    pkg.installed

mercurial:
    pkg.installed

# Friendly Interactive SHell
fish:
    pkg.installed

screen:
    pkg.installed

tmux:
    pkg.installed

minicom:
    pkg.installed

aptitude:
    pkg.installed

silversearcher-ag:
    pkg.installed

chromium-browser:
    pkg.installed

google-chrome-repo:
    pkgrepo.managed:
        - name: deb [arch=amd64] http://dl-ssl.google.com/linux/chrome/deb/ stable main
        - dist: stable
        - file: /etc/apt/sources.list.d/google-chrome.list
        - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub

    cmd.run:
        - name: 'wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O - | sudo apt-key add -'
        - unless: 'apt-key list | grep google.com'

google-chrome-stable:
    pkg.installed
