#!/bin/bash

if [ -f /workspace/blog/blog.py ]; then
    ln -svf /workspace/blog/blog.py /home/gitpod/.local/bin/blog 
fi
export EDITOR=vim
echo "\n. /scripts/path.sh\n" >> /home/gitpod/.bashrc
nvim --headless +"call dein#install()" +qall &
