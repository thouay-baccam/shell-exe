# Ce script génère un fichier contenant le nombre de connexions pour un utilisateur spécifique, puis le compresse et le sauvegarde dans un répertoire défini.

# Nom de l'utilisateur
utilisateur="baccam"

# Format de la date actuelle
date_format=$(date +"%d-%m-%Y-%H:%M")

# Nombre de connexions de l'utilisateur
nombre_connexions=$(last | grep "$utilisateur" | wc -l)

# Nom du fichier de sauvegarde
nom_fichier="number_connection-$date_format"

# Chemin de sauvegarde
chemin_sauvegarde="/home/baccam/shell-exe/Job08/Backup"

# Crée un fichier contenant le nombre de connexions
echo "$nombre_connexions" > "$nom_fichier"

# Crée une archive tar du fichier
tar -cvf "$chemin_sauvegarde/$nom_fichier.tar" "$nom_fichier"

# Supprime le fichier temporaire
rm "$nom_fichier"
