#!/bin/bash
echo "Tapez le nom du container à supprimer";
read nom_ctn;

echo "Tapez le nom d'image de container à supprimer";
read img_ctn;

docker stop $nom_ctn; docker rm $nom_ctn; docker rmi $img_ctn;

exit 0;