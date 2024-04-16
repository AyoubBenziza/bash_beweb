#!/bin/bash

function jeu(){

    justeprix=$((1 + RANDOM%100));
    i=1
    while [ $i -le 7 ]
    do
        nombre
        if [[ "$justeprix" -eq "$number" ]]; then
            echo "Vous avez trouvé le juste prix qui était de $justeprix€!";
            replay
        elif [[ "$justeprix" -lt "$number" ]]; then
            echo "Plus petit";
            essairestant=$((7-$i));
            echo "Le nombre d'essai restants est: $essairestant";
            ((i++)); #ou i= $(($i+1))
        else
            echo "Plus grand";
            essairestant=$((7-$i));
            echo "Le nombre d'essai restants est: $essairestant";
            ((i+5)); #ou i= $(($i+1))
        fi
    done

    echo "Vous avez perdu, le juste prix était: $justeprix€";
    replay
}

function nombre(){
    echo "Saisissez un nombre entre 1 et 100";
    read number;
    if ! [[ $number =~ ^[0-9]+$ ]]; then
        echo "Vous devez entrer un nombre";
        nombre
    fi
}

function replay(){
    echo "Si vous voulez rejouer, tapez Y";
    read rejouer;

    if [ "$rejouer"=="Y" ] || [ "$rejouer"=="y" ]; then
        clear
        jeu
    else 
        exit 0;
    fi
}

jeu