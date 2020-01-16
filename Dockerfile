FROM ubuntu:18.04
COPY . /home
RUN apt-get update && apt-get install -y \
    ansible
# CMD ansible-playbook /home/test.yml
