#!/bin/bash

export PATH=/home/gitpod/.local/bin:$PATH
if [ -f /workspace/blog/blog.py ]; then
    ln -svf /workspace/blog/blog.py /home/gitpod/.local/bin/blog 
fi
export EDITOR=vim 
export PIP_USER=no
sed -i 's/export PIP_USER=yes/export PIP_USER=no/g' /home/gitpod/.bashrc
nvim --headless +"call dein#install()" +qall &

