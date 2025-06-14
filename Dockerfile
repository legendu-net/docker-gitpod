# NAME: dclong/gitpod
FROM dclong/jupyterhub-ds
# GIT: https://github.com/legendu-net/docker-jupyterhub-ds.git

RUN icon spark -ic -d /opt \
    && /scripts/sys/purge_cache.sh 

RUN useradd gitpod -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash \
        -p '$6$/66f09NXfyvgYgct$IC5ba1I9V8uUK.aD6MXb/UkTO6cY.tKzcdHBTd68OcQiv0o5DiYwczvOUqBud0BgAWsZj1zVq/HBkDXD8uM5u/' \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

USER gitpod
WORKDIR /home/gitpod/
RUN icon bashit -ic \
    && icon ipython -c \
    && icon nvim -c -y \
    && /scripts/sys/purge_cache.sh

#COPY settings/settings.json .gitpod-code/User/settings.json
USER root
