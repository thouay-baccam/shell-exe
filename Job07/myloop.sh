# Cette boucle 'for' itère de 1 à 10 en utilisant la commande 'seq'.
# À chaque itération, elle affiche un message avec le numéro de l'itération.
for i in $(seq 1 10); do
  echo "Je suis un script qui sait faire une boucle" $i
done
