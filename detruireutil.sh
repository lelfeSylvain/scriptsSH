#! /bin/bash
# auteur Sylvain Parise
# date cr�ation 2014/02/12
# date derni�re modif 2016/03/15
# effacer un compte sur le serveur web accessible en http/ftp
# s'il n'y a qu'un param�tre on affiche la syntaxe de la commande
if [ $# -ne  2 ]; then
	echo "syntaxe :"
	echo $0" <nom du groupe> <nom du compte>"
	echo "exemple : "
	echo $0" slam1 g1"
	echo "  -> le compte slam1g1 est effac� "
	echo "  -> le r�pertoire /home/slam1g1 est effac�"
	echo "  -> le lien /var/www/slam1/slam1g1 vers /home/slam1g1/www aussi"
else
	# destruction de l'utilisateur
	deluser $1$2
	# destuction du r�pertoire 
	rm -R /home/$1$2
	# destruction du lien dans www
	rm /var/www/$1/$1$2
	# extension : v�rifier que le groupe existe toujours 
	#if [ ! -e /var/www/$1 ]; then
	#	mkdir /var/www/$1
	#fi
fi
