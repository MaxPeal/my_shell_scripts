#!/bin/bash

echo "Informe o nome do virtualenv:"
read venv
source "$HOME/.local/venvs/$venv/bin/activate"
if [ "$?" != "0" ]; then
    echo "Virtualenv: \"$venv\" não pôde ser ativado!"
    sleep 4
    exit 1
fi

echo "Informe o nome do projeto:"
read proj
cd "$HOME/Meus_Projetos/$proj"
if [ "$?" != "0" ]; then
    echo "Projeto: \"$proj\" não existe!"
    sleep 4
    exit 1
fi

gvim "+TlistAddFilesRecursive . [^_]*py\|*html\|*css\|*js" "+TlistOpen" "+DjangoProjectActivate $venv" 2> ~/log/gvim.err

exec bash
