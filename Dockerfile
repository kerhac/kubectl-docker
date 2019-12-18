FROM debian:buster-slim

ADD https://packages.cloud.google.com/apt/doc/apt-key.gpg /apt-key.gpg

RUN apt-get update \
    && apt-get install -y apt-transport-https gnupg2 ca-certificates \
    && apt-key add apt-key.gpg \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update \
    && apt-get install -y kubectl
