#!/usr/bin/env bash
domain_name=$1
domains=$2
email=$3
env=$4

if [ ! -e "/opt/sites/confs/$domain_name.conf" ]
then
    echo "Nginx config not found ... "
    exit -1
fi

if [ -d "/opt/sites/certs/$domain_name" ]
then
    echo "Certificate exists ... "
    exit -1
fi

if [ "$env" == "staging" ]
then
    certbot -n -d "$domains" --authenticator webroot --installer nginx -m "$email" --agree-tos --webroot-path "/opt/sites/cert-webroot" --staging
else
    certbot -n -d "$domains" --authenticator webroot --installer nginx -m "$email" --agree-tos --webroot-path "/opt/sites/cert-webroot"
fi

nginx -s reload
