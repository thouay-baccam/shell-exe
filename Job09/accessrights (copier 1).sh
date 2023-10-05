#!/bin/bash

path=$(dirname "$0")
modifsave=$(cat "$path/modifsave")
lastmodif=$(date -r "$path/Shell_Userlist.csv" '+%Y-%m-%d %H:%M:%S')

if [[ "$modifsave" != "$lastmodif" ]]; then
    while IFS="," read -r id prenom nom mdp role; do
        username=$(echo "$prenom.$nom" | tr '[:upper:]' '[:lower:]')

        # Vérifiez la longueur du nom d'utilisateur
        if [ ${#username} -lt 3 ]; then
            continue  # Ignore les noms d'utilisateurs de moins de 3 caractères
        fi

        nrole=$(echo "$role" | tr -d '\r' | cat -t)
        sudo useradd "$username"
        echo "$username:$mdp" | sudo chpasswd
        if [ "$nrole" = "Admin" ]; then
            sudo usermod -aG sudo "$username"
            echo "did $username"
        else
            sudo usermod -aG users "$username"
            echo "did $username"
        fi
    done < <(tail -n +2 "$path/Shell_Userlist.csv" | tr -d " " && echo "")
    date -r "$path/Shell_Userlist.csv" '+%Y-%m-%d %H:%M:%S' > "$path/modifsave"
fi
