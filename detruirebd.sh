#! /bin/bash
# auteur Sylvain Parise
# date création 2016/03/12
# date dernière modif 2016/03/16
# détruit une base de données mysql portant le nom de l'utilisateur
# détruit également l'utilisateur
# 
if [ $# -ne 1  ]; then
	#pas ou trop de paramètres lors de la commande
	echo "nombre de paramètres incorrect"
	echo "syntaxe : " $0 " <nom de l'utilisateur à supprimer> "
	echo "vous avez tape : $0 $1 $2 $3 $4 $5 $6 $7 $8 $9"
else
	# commande mysql : nécessite l'identification d'un utilisateur ayant des droits étendus
	mysql -u root --password="$(cat note/fich)" --execute="DROP USER '$1'@'%';"
	mysql -u root --password="$(cat note/fich)" --execute="DROP USER '$1'@'localhost';"
	mysql -u root --password="$(cat note/fich)" --execute="DROP DATABASE IF EXISTS $1 ;"
fi
