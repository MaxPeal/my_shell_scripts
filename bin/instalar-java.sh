#!/bin/bash

if [ -z "$6" ]; then
    echo -e "Uso: `basename $0` \\ \n\tjdk.tar.gz \\ \n\tjdk-demos.tar.gz \\ \n\trootdir \\ \n\tdir \\ \n\tjdk-apidocs.zip \\ \n\tjavafx-apidocs.zip"
    exit 0
fi

sudo tar xzvf $1 -C "$3" --no-same-owner
sudo tar xzvf $2 -C "$3" --no-same-owner
sudo unzip -d "${3}/${4}" $5
sudo unzip -d "${3}/${4}" $6
sudo mv "${3}/${4}/api" "${3}/${4}/docs/javafx-api"

exit 0
