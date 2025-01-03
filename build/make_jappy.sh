#!/bin/bash


PLATFORM=linux/amd64,linux/arm64
NO_CACHE=--no-cache 

case $1 in
    jupyter)
        docker build $NO_CACHE --platform=$PLATFORM --tag=gastudil/courses:jappy-jupyter -f Dockerfile-jupyter .
        ;;
    vscode)
        docker build $NO_CACHE --platform=$PLATFORM --tag=gastudil/courses:jappy-vscode -f Dockerfile-vscode . 
        ;;
    *)
        printf "Uso: $0 jupyter|vscode\n"
        ;;
esac