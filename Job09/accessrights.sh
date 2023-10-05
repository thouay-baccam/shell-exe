# Crée 'modifsave' s'il n'existe pas encore ou la dernière date de modification seras enregistrée.
# Si le fichier existe, vérifie si le fichier 'Shell_Userlist.csv' a été modifié en se basant sur les données dans modifsave
path=$(dirname "$0")
modifsave=$(cat "$path/modifsave")
lastmodif=$(date -r "$path/Shell_Userlist.csv" '+%Y-%m-%d %H:%M:%S')

# Si 'Shell_Userlist.csv' est modifié, le script crée et attribue des utilisateurs en fonction des rôles.
if [[ "$modifsave" != "$lastmodif" ]]; then
    while IFS="," read -r id prenom nom mdp role; do
        username=$(echo "$prenom.$nom" | tr '[:upper:]' '[:lower:]')

        # Ignore les noms d'utilisateurs de moins de 3 caractères.
        [ ${#username} -lt 3 ] && continue

        nrole=$(echo "$role" | tr -d '\r' | cat -t)
        sudo useradd "$username"
        echo "$username:$mdp" | sudo chpasswd
        [ "$nrole" = "Admin" ] && sudo usermod -aG sudo "$username" || sudo usermod -aG users "$username"
        echo "did $username"
    done < <(tail -n +2 "$path/Shell_Userlist.csv" | tr -d " " && echo "")
    
    # Met à jour le timestamp de modification.
    date -r "$path/Shell_Userlist.csv" '+%Y-%m-%d %H:%M:%S' > "$path/modifsave"
fi
