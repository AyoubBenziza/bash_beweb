#!/bin/bash

# name="Toto";
# value=9;
# 
# echo "Salut à tous, dites bonjour $name qui a $value ans aujourd'hui!";
# value=$(($value-1));
# 
# echo "Avec $value dents"
# echo "Et $((1 + RANDOM%100)) € dans son porte-monnaie.";

# echo "Décollage dans"
# for ((i=10;i>0;i--)); do
    # echo $i;
    # if [ $i -lt 0 ]
        # then echo "Décollage!!!";
    # fi
# done

rows=$@
#Normal
for((i=1; i<=rows; i++))
do
  for((j=1; j<=rows - i; j++))
  do
    echo -n "  ";
  done
  for((j=1; j<=2*i - 1; j++))
  do
    echo -n "X ";
  done
  echo
done

#Reverse
for((i=rows; i>=1; i--))
do
  for((j=rows; j<rows; j++))
  do
    echo -n " ";
  done
  for((j=1;j<=2*i - 1; j++))
  do
    echo -n "X ";
  done
  echo
done

exit 0;