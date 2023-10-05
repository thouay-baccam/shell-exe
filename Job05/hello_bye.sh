# Ce script vérifie la valeur du premier argument ($1) et affiche un message en conséquence.

# Exemple d'utilisation :
# Pour saluer avec "Hello", exécutez : "./nom_du_script.sh Hello"
# Pour dire au revoir avec "Bye", exécutez : "./nom_du_script.sh Bye"

if [[ "$1" == "Hello" ]]; then
  echo "Bonjour, je suis un script !"
elif [[ "$1" == "Bye" ]]; then
  echo "Au revoir et bonne journée !"
fi
