#!/usr/bin/env bash

mv -v nginx-confs/* /etc/nginx/conf.d/

mv cert-webroot /root/

# reload nginx
nginx -s reload

# exec cerbot
certbot -d ezirmusitua.com,www.ezirmusitua.com --authenticator webroot --installer nginx -n -m jferroal@gmail.com --agree-tos

# add renew cert cron task
crontab -u root autorenew.txt

# reload nginx
nginx -s reload
