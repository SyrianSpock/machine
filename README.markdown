# Dev machine

## Installation
1. Install Ubuntu 18.04 on the laptop. The user is assumed to `salah`
2. Bootstrap saltstack
3. Clone this repository somewhere
4. Symlink to Salt `sudo ln -s /path/to/repo/salt/roots/ /srv/salt/`
5. Run `sudo salt-call --local state.highstate`
6. Reboot

