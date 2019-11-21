FROM dclong/jupyterhub-ds

RUN groupadd -o -g 9999 docker \
    && useradd -oml -u 9999 -g docker -d /home/gitpod -s /bin/bash -c gitpod gitpod

USER gitpod
RUN nvim --headless +"call dein#install()" +qall \
    && xinstall svim -ic \
    && xinstall dsutil -ic \
    && xinstall pt -ic
 
USER root
