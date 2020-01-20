# Dev machine

## Installation
1. Install Ubuntu 18.04 on the laptop. The user is assumed to be `salah`
2. Install Ansible `apt-get update && apt-get install -y ansible`
3. Clone this repository somewhere
5. Run `ansible-playbook /home/site.yml`
6. Reboot

## Test with Docker
```
docker build . -t ansible-test
docker run -it ansible-test ansible-playbook /home/site.yml
```
