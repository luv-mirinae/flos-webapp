#!/usr/bin/env bash

# see https://docs.docker.com/engine/install/centos/

check_docker() {
    if [[ ! -x /usr/bin/docker ]]; then
        install_docker
    fi
}

install_docker() {
    sudo dnf remove docker \
                    docker-client \
                    docker-client-latest \
                    docker-common \
                    docker-latest \
                    docker-latest-logrotate \
                    docker-logrotate \
                    docker-engine
    sudo dnf -y install dnf-plugins-core && \
    sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    sudo systemctl enable --now docker
}

main() {
    check_docker
}

main
