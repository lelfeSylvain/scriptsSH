#! /bin/bash
# auteur Sylvain Parise
# date création 2014/02/12
# date dernière modif 2016/03/15
# créé un utilisateur et sa base de données
# s'il n'y a qu'un paramètre on affiche la syntaxe de la commande
if [ $# -ne  3 ]; then
	echo "erreur de syntaxe" $0 $1 $2 $3
	echo "syntaxe :"
	echo $0" <classe> <groupe dans la classe> <motdepasse>"
	echo "exemple : "
	echo $0" slam1 g1 p_4r3T#o"
	echo "  -> le compte slam1g1 est créé (voir /home)"
	echo "  -> le répertoire /home/slam1g1/www est créé"
	echo "  -> le lien est créé entre /var/www/slam1/slam1g1 et /home/slam1g1/www"
	else
	./creerutil.sh $1 $2 $3
	./creerbd.sh $1$2 $3
fi
