FROM dclong/jupyterhub-ds

RUN echo "$(date)" > /scripts/sys/version

# avoid install Python packages into $HOME/.local/lib as GitPod does not search it
RUN curl -sSL www.legendu.net/media/install_py_github.py | python3 - https://github.com/dclong/dsutil --sys \
    && pip3 install pelican

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

USER gitpod
RUN xinstall ipy3 -c \
    && xinstall svim -ic && nvim --headless +"call dein#install()" +qall \
    && xinstall pt -ic
 
USER root
