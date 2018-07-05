#!/usr/bin/env bash

# handling cert webroot nginx config and other conf
# sed -i 's/#domain#/$1/g' cert.conf
# mv cert.conf /etc/nginx/conf.d/
# sed -i '$d' /etc/nginx/nginx.conf
# sed -i '$a\ \ \ \ include '$4';' /etc/nginx/nginx.conf
# sed -i '$a}' /etc/nginx/nginx.conf

# move cert-webroot to home
# mv cert-webroot /root/

# reload nginx
# nginx -s reload

# exec cerbot
certbot -d ezirmusitua.com,www.ezirmusitua.com --authenticator webroot --installer nginx -n -m jferroal@gmail.com --agree-tos

# add renew cert cron task
crontab -u root autorenew.txt

# reload nginx
nginx -s reload
