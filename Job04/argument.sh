# Ce script utilise 'cat' avec 'sudo' pour copier le contenu d'un fichier source spécifié.
# L'utilisation de 'sudo' accorde les droits de superutilisateur.
#
# Exemple d'utilisation : './argument.sh destination.txt source.txt'
sudo cat $2 > $1
