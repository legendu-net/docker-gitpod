#!/bin/bash

if [ -f /workspace/blog/blog.py ]; then
    ln -svf /workspace/blog/blog.py /home/gitpod/.local/bin/blog 
fi
export EDITOR=vim
nvim --headless +"call dein#install()" +qall &

