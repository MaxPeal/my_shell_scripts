#!/bin/bash

remover_listas ()
{
    sudo rm -f /var/lib/apt/lists/*_{Sources,Packages,Release,Release.gpg}
    sudo rm -f /var/lib/apt/lists/partial/*
}

remover_pacotes ()
{
    sudo rm -f /var/cache/apt/archives/*deb
    sudo rm -f /var/cache/apt/archives/partial/*
}

case "$1" in
    "pacotes")
        remover_pacotes
        ;;
    "listas")
        remover_listas
        ;;
    *)
        remover_pacotes
        remover_listas
        ;;
esac
