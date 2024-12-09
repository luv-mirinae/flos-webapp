#!/usr/bin/env bash

DOMAIN=$1
WILDCARD="*.$DOMAIN"
COUNT_ARGS=$#

check_certbot() {
    if [[ ! -x /usr/bin/certbot ]]; then
        sudo dnf -y install certbot
    fi
}

install() {
    if [[ $COUNT_ARGS -ne 1 ]]; then
        echo "usage: install_cert.sh <domain>"
        exit 1
    fi
    sudo certbot -d $DOMAIN -d $WILDCARD --manual --preferred-challenges dns certonly
}

main() {
    check_certbot
    install
}

main
