#!/usr/bin/env bash
nginx -g "daemon on;"

cp nginx-confs/http_** /etc/nginx/conf.d/

# reload nginx
nginx -s reload

# exec cerbot
certbot -n -d ezirmusitua.site,www.ezirmusitua.site\
    --authenticator webroot\
    --installer nginx -m jferroal@gmail.com --agree-tos\
    --webroot-path "/src/cert-webroot" --staging
#--webroot-map {"ezirmusitua.site,www.ezirmusitua.site":"/src/cert-webroot"}\

nginx -s reload

# add renew cert cron task
crontab -u root autorenew.txt

# reload nginx
nginx -s reload
