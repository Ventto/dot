#!/bin/bash

rmctr(){
    # shellcheck disable=SC2068
    docker rm -f $@ 2>/dev/null || true
}

alias dps="docker ps -a"
