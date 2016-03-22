#! /bin/bash
# auteur Sylvain Parise
# date création 206/03/21
# date dernière modi 
#
if [ $# -ne 1  ]; then
	#pas ou trop de param�tres lors de la commande
	echo "nombre de parametres incorrect\n syntaxe : " $0 " <fichier des utilisateurs>"
else	
	fich=$1
	oldIFS="$IFS"
    IFS=":"
	while read classe groupe mdp
	do
		./creerutil.sh $classe $groupe $mdp
	done < $fich
	IFS="$oldIFS"
fi
