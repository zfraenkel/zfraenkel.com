#!/usr/local/bin/bash

ssh root@brick.01z.io 'mkdir -p /var/www/zfraenkel'

scp index.html root@brick.01z.io:/var/www/zfraenkel/index.html
scp zfraenkel.caddy root@brick.01z.io:/etc/caddy/zfraenkel.caddy

ssh root@brick.01z.io 'systemctl restart caddy'
