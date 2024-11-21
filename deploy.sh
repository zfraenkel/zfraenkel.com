#!/usr/local/bin/bash

ssh root@brick.01z.io 'mkdir -p /var/www/zfraenkel'

scp index.html root@zfraenkel.com:/var/www/zfraenkel/index.html
scp zfraenkel.caddy root@zfraenkel.com:/etc/caddy/zfraenkel.caddy

ssh root@brick.01z.io 'systemctl restart caddy'
