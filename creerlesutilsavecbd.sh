#! /bin/bash
# auteur Sylvain Parise
# date création 2014/02/12
# date dernière modif 2016/03/15
# 
if [ $# -ne 1  ]; then
	#pas ou trop de paramètres lors de la commande
	echo "nombre de parametres incorrect\n syntaxe : " $0 " <fichier des utilisateurs>"
else	
	fich=$1
	oldIFS="$IFS"
    IFS=":"
	while read classe groupe mdp
	do
		./creerutilavecbd.sh $classe $groupe $mdp
		
		
	done < $fich
	IFS="$oldIFS"
fi
