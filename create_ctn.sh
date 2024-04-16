#!/bin/bash

numberPort () {
    echo "Tapez le numéro de port du container"
    read port
    if [[ $port ]] && [ $port -eq $port 2>/dev/null ]
    then
        return $port
    else
        echo "$port n'est pas un entier ou défini"
        numberPort
    fi
}

echo "Tapez votre nom de container à créer:"
read nom_ctn

echo "Tapez le nom d'image docker à utiliser:"
read image_ctn

echo "Suivi de sa version:"
read version_image_ctn

numberPort

docker run -d --name $nom_ctn \
-p 127.0.0.1:$port:80 \
-v $(pwd)/app:/app \
$image_ctn:$version_image_ctn;

exit 0;