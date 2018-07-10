#!/usr/bin/env bash
nginx

cp nginx-confs/* /etc/nginx/conf.d/

# reload nginx
nginx -s reload

# exec cerbot
certbot -n -d ezirmusitua.site,www.ezirmusitua.site\
    --authenticator webroot\
    --installer nginx -m jferroal@gmail.com --agree-tos\
    --webroot-path "/src/cert-webroot"
#--webroot-map {"ezirmusitua.site,www.ezirmusitua.site":"/root/cert-webroot"}\

# add renew cert cron task
crontab -u root autorenew.txt

# reload nginx
nginx -s reload
