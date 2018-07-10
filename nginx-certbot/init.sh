#!/usr/bin/env bash

cp nginx-confs/* /etc/nginx/conf.d/

cp -r cert-webroot /root/

# reload nginx
nginx

# exec cerbot
certbot -n -d ezirmusitua.com,www.ezirmusitua.com\
    --authenticator webroot\
    --installer nginx -m jferroal@gmail.com --agree-tos\
    --webroot-path "/root/cert-webroot"
#--webroot-map {"ezirmusitua.site,www.ezirmusitua.site":"/root/cert-webroot"}\

# add renew cert cron task
crontab -u root autorenew.txt

# reload nginx
nginx
