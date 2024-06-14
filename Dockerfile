FROM jenkins/jenkins:lts

USER root

# Installer Docker CLI
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://download.docker.com/linux/static/stable/x86_64/docker-23.0.3.tgz && \
    tar zxvf docker-23.0.3.tgz && \
    cp docker/docker /usr/local/bin && \
    rm -rf docker-23.0.3.tgz docker && \
    apt-get purge -y wget && \
    apt-get clean

# Installer les outils client MySQL
RUN apt-get update && \
    apt-get install -y default-mysql-client && \
    apt-get clean

# Débogage : Afficher la version du client MySQL installé
RUN mysql --version

USER jenkins
