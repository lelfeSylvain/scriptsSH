#! /bin/bash
# auteur Sylvain Parise
# date création 2014/02/12
# date dernière modif 2016/0317
# créé une base de données mysql portant le nom de l'utilisateur
# donne tous les droits à cette BD
# merci à T.VENDRISSE & K.ENGEL promo 2013-15
if [ $# -lt 2  ]; then
	#pas ou trop de paramètres lors de la commande
	echo "nombre de paramètres incorrect\n syntaxe : " $0 " <nom de l'utilisateur> <motdepasse>"
else
	# commande mysql : nécessite l'identification d'un utilisateur ayant des droits étendus
	mysql -u root --password="$(cat note/fich)" --execute="CREATE USER '$1'@'localhost' IDENTIFIED BY '$2'; CREATE DATABASE $1 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
	mysql -u root --password="$(cat note/fich)" --execute="CREATE USER '$1'@'%' IDENTIFIED BY '$2'; "
	mysql -u root --password="$(cat note/fich)" --execute="USE $1 ; GRANT ALL PRIVILEGES ON $1.* TO $1 WITH GRANT OPTION ;"
fi

