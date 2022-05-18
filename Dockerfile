# NAME: dclong/gitpod
FROM dclong/jupyterhub-ds
# GIT: https://github.com/legendu-net/docker-jupyterhub-ds.git

RUN xinstall spark -ic --loc /opt \
    && pip3 install -U \
        pyspark findspark \
        pelican pelican-render-math "pelican-jupyter==0.10.0" \
        beautifulsoup4 typogrify \
    && /scripts/sys/purge_cache.sh 

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

USER gitpod
WORKDIR /home/gitpod/
RUN xinstall ipython -c \
    && xinstall svim -ic && nvim --headless +"call dein#install()" +qall \
    && xinstall pt -ic \
    && /scripts/sys/purge_cache.sh

COPY scripts/ /scripts/
#COPY settings/settings.json .gitpod-code/User/settings.json
USER root
