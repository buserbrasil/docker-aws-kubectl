FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    awscli \
    curl \
    gettext-base \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/bin/kubectl

RUN curl --silent -LO https://get.helm.sh/helm-v3.7.2-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.7.2-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/bin/helm