#!/usr/bin/env bash

check_firewall() {
    if [[ ! -x /usr/bin/firewall-cmd ]]; then
        sudo dnf -y install firewalld && \
        sudo systemctl enable firewalld && \
        sudo systemctl restart firewalld
    fi
}

add_chain() {
    sudo firewall-cmd --permanent --zone=public --add-service=http
    sudo firewall-cmd --permanent --zone=public --add-service=https
    sudo firewall-cmd --reload
}

main() {
    check_firewall
    add_chain
}

main
