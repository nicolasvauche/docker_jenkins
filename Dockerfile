FROM jenkins/jenkins:lts
USER root
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz && \
    tar zxvf docker-20.10.9.tgz && \
    cp docker/docker /usr/local/bin && \
    rm -rf docker-20.10.9.tgz docker && \
    apt-get purge -y wget && \
    apt-get clean
