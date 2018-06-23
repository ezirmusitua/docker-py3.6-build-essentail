#!/usr/bin/env bash
git clone https://github.com/notablemind/jupyter-nodejs.git
cd jupyter-nodejs
mkdir -p ~/.ipython/kernels/nodejs/
npm install && node install.js && npm run build && npm run build-ext
cd .. && rm -rf jupyter-nodejs