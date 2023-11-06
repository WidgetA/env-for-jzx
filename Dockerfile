FROM ubuntu:latest

LABEL maintainer="Widget_An <widget@infranative.com>"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# os update
RUN apt-get -y update && apt-get -y upgrade && apt-get -y autoremove && apt-get -y autoclean

# build tool
RUN apt-get install -y build-essential curl

# R
RUN apt-get install -y wget \
&& apt-get install -y --no-install-recommends software-properties-common dirmngr \
&& wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc \
&& add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" \
&& apt-get install -y --no-install-recommends r-base

# BioManager
RUN R -e "install.packages(c('BiocManager'), dependencies=TRUE)"
RUN R -e "BiocManager::install(c('org.Hs.eg.db', update=TRUE, dependencies=TRUE))"