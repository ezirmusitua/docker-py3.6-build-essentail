#!/usr/bin/env bash

cp nginx-confs/* /etc/nginx/conf.d/

cp -r cert-webroot /root/

# reload nginx
nginx

# exec cerbot
certbot -n -d ezirmusitua.com,www.ezirmusitua.com\
    --authenticator webroot  webroot-map = {"ezirmusitua.site,www.ezirmusitua.site":"/root/cert-webroot"}\
    --installer nginx -m jferroal@gmail.com --agree-tos

# add renew cert cron task
crontab -u root autorenew.txt

# reload nginx
nginx
