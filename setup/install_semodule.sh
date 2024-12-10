#!/usr/bin/env bash

# Troubleshoot: If SELinux block HTTP reverse proxy ports(like 8081, 8082),
# execute "sudo sealert -a /var/log/audit/audit.log" and this script

install_semodule() {
    if [[ -x /usr/sbin/ausearch ]] && [[ -x /usr/bin/audit2allow ]]; then
        sudo ausearch -c 'nginx' --raw | audit2allow -M flos-nginx 2>&1 >/dev/null
        if [[ -f ./flos-nginx.pp ]]; then
            sudo semodule -X 300 -i flos-nginx.pp
        fi
    fi
}

main() {
    install_semodule
}

main
