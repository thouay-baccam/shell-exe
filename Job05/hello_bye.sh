# Ce script vérifie la valeur du premier argument ($1)
# et affiche un message en conséquence.

if [[ "$1" == "Hello" ]]; then
  echo "Bonjour, je suis un script !"
elif [[ "$1" == "Bye" ]]; then
  echo "Au revoir et bonne journée !"
else
  echo "Usage : $0 [Hello|Bye]"
fi
