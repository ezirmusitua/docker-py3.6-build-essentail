FROM ubuntu:16.04

COPY . src
WORKDIR src

RUN apt update -y &&\
    apt upgrade -y &&\
    apt install -y apt-utils curl wget build-essential \
    git pkg-config automake autoconf python-software-properties \
    python3 python3-pip
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt install -y nodejs
RUN bash install-zmq.sh
RUN python3 -m pip install jupyter pixiedust_node jupyter-c-kernel &&\
    install_c_kernel
RUN bash install-node-kernel.sh
RUN npm install -g --unsafe-perm --verbose ijavascript && ijsinstall

CMD jupyter

