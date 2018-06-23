#!/usr/bin/env bash
wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.16.tar.gz

ls && tar zxvf libsodium-1.0.16.tar.gz && cd libsodium-1.0.16
bash configure
make && make install
cd .. && rm -rf libsodium-1.0.16 && rm libsodium-1.0.16.tar.gz

wget https://github.com/zeromq/libzmq/releases/download/v4.2.3/zeromq-4.2.3.tar.gz
tar zxvf zeromq-4.2.3.tar.gz && cd zeromq-4.2.3
bash autogen.sh && bash configure
make && make install
ldconfig
cd .. && rm -rf zeromq-4.2.3 && rm zeromq-4.2.3.tar.gz