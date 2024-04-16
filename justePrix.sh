#!/bin/bash

function jeu(){

    justeprix=$((1 + RANDOM%100));
    for((i=1; i<=7; i++))
    do
        nombre
        if [[ "$justeprix" -eq "$number" ]]; then
            echo "Vous avez trouvé le juste prix qui était de $justeprix€!";
            replay
        elif [[ "$justeprix" -lt "$number" ]]; then
            echo "Plus petit";
            essairestant=$((7-$i));
            echo "Le nombre d'essai restants est: $essairestant";
        else
            echo "Plus grand";
            essairestant=$((7-$i));
            echo "Le nombre d'essai restants est: $essairestant";
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