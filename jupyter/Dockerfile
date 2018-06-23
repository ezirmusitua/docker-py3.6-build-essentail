FROM ubuntu:16.04

# The path to start notebook
ENV START_PATH "~/jupyter-data/"

RUN apt update -y &&\
    apt upgrade -y &&\
    apt install -y apt-utils curl wget build-essential \
    git pkg-config automake autoconf python-software-properties \
    python3 python3-pip
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt install -y nodejs

COPY . src
WORKDIR src

RUN bash install-zmq.sh
RUN python3 -m pip install jupyter pixiedust_node jupyter-c-kernel &&\
    install_c_kernel
RUN bash install-node-kernel.sh
RUN npm install -g --unsafe-perm --verbose ijavascript && ijsinstall

CMD cd $START_PATH && jupyter notebook --config

# uncomment following to run jupyter with command line
## sudo docker run --name jupyter -p 8080:8080 jupyter
# EXPOSE 8080
# CMD jpyter notebook --ip="0.0.0.0" --port="8080" --allow-root

