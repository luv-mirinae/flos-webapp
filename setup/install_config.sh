#!/usr/bin/env bash

check_nginx() {
    if [[ ! -x /usr/sbin/nginx ]]; then
        sudo dnf -y install nginx
    fi
}

copy_config() {
    sudo cp ../nginx/nginx.conf /etc/nginx/
    sudo cp ../nginx/conf.d/* /etc/nginx/conf.d/
}

main() {
    check_nginx
    copy_config
}

main
