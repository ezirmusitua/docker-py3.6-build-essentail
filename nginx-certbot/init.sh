#!/usr/bin/env bash
# TODO: use config to start
nginx -g "daemon on;" -c nginx.conf

# exec certbot
if [ -e /opt/sites/certificates/ ]
then
    # TODO: detect is cert exists
    certbot -n -d <domains>\
        --authenticator webroot\
        --installer nginx -m <email> --agree-tos\
        --webroot-path "/src/cert-webroot" --staging
    #--webroot-map {"ezirmusitua.site,www.ezirmusitua.site":"/src/cert-webroot"}\
    nginx -s reload
fi

# add renew cert cron task
crontab -u root autorenew.txt
