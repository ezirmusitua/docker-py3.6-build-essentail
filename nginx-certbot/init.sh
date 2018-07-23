#!/usr/bin/env bash
crontab -u root autorenew.txt
nginx -g "daemon off;" -c /src/nginx.conf
