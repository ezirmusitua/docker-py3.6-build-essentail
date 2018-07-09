FROM nginx:latest

EXPOSE 22
EXPOSE 80
EXPOSE 443

# May need to expose more ports like 3000 api.example.com

RUN touch /etc/apt/sources.list.d/stretch-backports.list && \
    echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/stretch-backports.list &&\
    apt update -y && apt upgrade -y && apt install -y -t stretch-backports python-certbot-nginx cron
COPY . src
WORKDIR src

#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT bash ./init.sh
