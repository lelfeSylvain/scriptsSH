#! /bin/sh
# auteur Sylvain Parise
# date création 2014/02/12
# date dernière modif 2016/02/29
# créer des comptes sur le serveur web accessible en http/ftp
# s'il n'y a qu'un paramètre on affiche la syntaxe de la commande
if [ $# -lt  2 ]; then
	echo "syntaxe :"
	echo $0" <groupe> <nom du compte> [<motdepasse>]"
	echo "exemple : "
	echo $0" slam1 g1"
	echo "  -> le compte slam1g1 est créé (voir /home)"
	echo "  -> le répertoire /home/slam1g1/www est créé"
	echo "  -> le lien est cree entre /var/www/slam1/slam1g1 et /home/slam1g1/www"
	echo "  -> le mot de passe par défaut est slam1g1"
else
	# si le répertoire du groupe n'existe pas il faut le créer
	if [ ! -e /var/www/$1 ]; then
		mkdir /var/www/$1
		groupadd $1
	fi
	# création de l'utilisateur
	if [ -z $3 ]; then 
		mdp=$(mkpasswd $1$2)
	else
		mdp=$(mkpasswd $3)
	fi
	useradd -m -p $mdp $1$2 -s /bin/bash  -g $1 -G group-etudiant	
	# création du lien symbolique
	ln -s  /home/$1$2/www /var/www/$1/$1$2
fi
