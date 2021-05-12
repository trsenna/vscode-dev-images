FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update --no-install-recommends \
    && apt-get -y upgrade --no-install-recommends \
    && apt-get autoremove -y \
    && apt-get clean -y

RUN apt-get -y update --no-install-recommends \
    && apt-get -y install --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    dialog \
    g++ \
    gcc \
    git \
    gnupg2 \
    htop \
    iotop \
    iputils-ping \
    less \
    make \
    mercurial \
    mysql-client \
    nano \
    net-tools \
    openssh-client \
    postgresql-client \
    rsync \
    software-properties-common \
    sqlite3 \
    subversion \
    sudo \
    tar \
    tree \
    unzip \
    vim \
    wget \
    whois \
    zip \
    && apt-get autoremove -y \
    && apt-get clean -y

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

WORKDIR /workspace
RUN sudo chown vscode:vscode /workspace
