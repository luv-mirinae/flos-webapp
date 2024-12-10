#!/usr/bin/env bash

check_nginx() {
    if [[ ! -x /usr/sbin/nginx ]]; then
        sudo dnf -y install nginx
    fi
    sudo systemctl enable nginx
}

copy_config() {
    sudo cp ../nginx/nginx.conf /etc/nginx/
    sudo cp ../nginx/conf.d/* /etc/nginx/conf.d/
}

update_selinux() {
    if [[ -x /usr/sbin/setsebool ]]; then
        # see also: sealert -a /var/log/audit/audit.log
        sudo setsebool -P httpd_can_network_relay 1
    fi
}

main() {
    check_nginx
    copy_config
    update_selinux
}

main
