#!/bin/bash

# echo "Tapez une valeur";

# read readedValue;

# echo "La valeur est $readedValue";

# echo "Le premier argument est $1"
# echo "Le deuxième argument est $2"
# echo "L'ensemble des arguments est $@"

#Plan
#Nom du projet
echo "Tapez votre nom de votre projet";
read nomprojet;
if [[ -z "$nomprojet" ]]; then
    echo "Erreur: C'est vide";
    exit 1;
fi

echo "Tapez votre nom d'utilisateur GitLab";
read user;
if [[ -z "$user" ]]; then
    echo "Erreur: C'est vide";
    exit 1;
fi

echo "Tapez votre token";
read -s token;
if [[ -z "$token" ]]; then
    echo "Erreur: C'est vide";
    exit 1;
fi 

urlconfig=https://$user:$token@gitlab.com/$user/$nomprojet
# git config remote.origin.url urlconfig

url=https://gitlab.com/$user/$nomprojet.git

#Création du projet
git init $nomprojet
cd $nomprojet
touch present.txt
touch README.md
git add .
echo "Tapez votre message de commit";
read message;
git commit -m "$message"
git remote add origin $url
git config remote.origin.url $urlconfig
git push -u origin main
echo "Si vous voulez créer des branches secondaires, tapez Y";
read demande;
if [[ "$demande"=="Y" ]]; then
    echo "Tapez votre nombre de branches";
    read numberbr;
fi

if [[ -z "$numberbr" ]]; then
     echo "Erreur: C'est vide";
    exit 1;
else
    for((i=1;i<=$numberbr;i++))
    do
        name="branch$i";
        git branch $name
        git push origin $name
    done
fi

exit 0;