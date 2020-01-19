FROM ubuntu:18.04
RUN apt-get update && apt-get install -y \
    ansible
COPY . /home
# CMD ansible-playbook /home/site.yml
