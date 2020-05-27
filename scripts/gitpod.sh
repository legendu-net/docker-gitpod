#!/bin/bash

if [ -f /workspace/blog/main.py ]; then
    ln -s /workspace/blog/main.py /home/gitpod/.local/bin/blog 
fi
export EDITOR=vim 
export PIP_USER=no
sed -i 's/export PIP_USER=yes/export PIP_USER=no/g' /home/gitpod/.bashrc
nvim --headless +"call dein#install()" +qall &

