#!/bin/bash

# Supprimer le lien symbolique s'il existe
if [ -L /usr/local/bin/gdoc ]; then
  sudo rm /usr/local/bin/gdoc
fi

# Créer un nouveau lien symbolique vers le script
sudo ln -s "$(pwd)/gdoc.sh" /usr/local/bin/gdoc

# Rendre le script exécutable (si ce n’est pas déjà fait)
chmod +x gdoc.sh

VERSION="1.0.0"
echo -e "Commande 'gdoc' installée globalement !\nGénérez vos documents avec la commande 'gdoc init'"
