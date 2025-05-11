#!/bin/bash

docker pull dclong/jupyterhub-ds:next
docker build -t dclong/gitpod:next .
