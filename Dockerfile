FROM ubuntu:latest

LABEL maintainer="Widget_An <widget@infranative.com>"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# os update
RUN apt-get -y update && apt-get -y upgrade && apt-get -y autoremove && apt-get -y autoclean

# R
RUN apt install -y wget \
&& apt install -y --no-install-recommends software-properties-common dirmngr \
&& wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc \
&& add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" \
&& apt install --no-install-recommends r-base

