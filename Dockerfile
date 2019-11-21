FROM dclong/jupyterhub-ds

RUN xinstall dsutil -ic --sys

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

USER gitpod
RUN nvim --headless +"call dein#install()" +qall \
    && xinstall ipy3 -c \
    && xinstall svim -ic \
    && xinstall pt -ic
 
USER root
