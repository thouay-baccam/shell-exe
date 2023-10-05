utilisateur="baccam"
date_format=$(date +"%d-%m-%Y-%H:%M")
nombre_connexions=$(last | grep "$utilisateur" | wc -l)
nom_fichier="number_connection-$date_format"
chemin_sauvegarde="/home/baccam/shell.exe/Job08/Backup"
echo "$nombre_connexions" > "$nom_fichier"
tar -cvf "$chemin_sauvegarde/$nom_fichier.tar" "$nom_fichier"
rm "$nom_fichier"
