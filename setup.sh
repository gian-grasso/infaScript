#!/bin/sh
################################################################################
# Copyright (c) [2024] [Ravindu Deshan, Eren]
#
# Unauthorized publication is prohibited. Forks and personal use are allowed.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.
################################################################################
cd $HOME
DIR=$(pwd)

setup(){
    rm -rf "$DIR/infaScript" > /dev/null 2>&1
    echo -e "\nCloning Script...\n"
    git clone https://github.com/Infamousmick/infaScript.git -b Personal
    echo -e "\n[i] Done..!\n"
    cd $DIR/infaScript
    chmod +x -R *
}
setup
