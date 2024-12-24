#!/bin/bash


PLATFORM=linux/amd64,linux/arm64
NO_CACHE=--no-cache 

case $1 in
    base)
        docker build $NO_CACHE --platform=$PLATFORM --tag=gastudil/courses:jappy-base -f Dockerfile-base .
        ;;
    vscode)
        docker build $NO_CACHE --platform=$PLATFORM --tag=gastudil/courses:jappy-vscode -f Dockerfile-vscode . 
        ;;
    *)
        printf "Uso: $0 base|vscode\n"
        ;;
esac