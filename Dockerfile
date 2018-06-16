FROM jenkins/jenkins:latest
MAINTAINER ivanturianytsia.work@gmail.com
USER root
# Install the latest Docker CE binaries
RUN apt-get -qq update \
   && apt-get -qq -y install \
   curl
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -a -G staff,docker jenkins
USER jenkins
