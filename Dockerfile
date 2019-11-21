FROM dclong/jupyterhub-ds

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

USER gitpod
RUN nvim --headless +"call dein#install()" +qall \
    && xinstall svim -ic \
    && xinstall dsutil -ic \
    && xinstall pt -ic
 
USER root
