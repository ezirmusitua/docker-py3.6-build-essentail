FROM nginx:latest

ENV DOMAINS "example.com,example.example.com"
ENV CERT_WEBROOT "~/cert-webroot"
ENV EMAIL "example@example.com"
ENV NGINX_CONFIGS "volumes/path/to/nginx_configs"

EXPOSE 22
EXPOSE 80
EXPOSE 443

# May need to expose more ports like 3000 api.example.com

RUN touch /etc/apt/sources.list.d/stretch-backports.list && \
    echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/stretch-backports.list &&\
    apt update -y && apt upgrade -y && apt install -y -t stretch-backports python-certbot-nginx &&\
    apt install -y openssh-server cron
COPY . src
WORKDIR src

#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT init.sh $DOMAINS $CERT_WEBROOT $EMAIL $NGINX_CONFIGS
