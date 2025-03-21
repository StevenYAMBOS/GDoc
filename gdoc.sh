#!/bin/bash

VERSION="1.0.0"
COMMAND=$1

case "$COMMAND" in
  init)
# Définir le chemin du répertoire courant du script (même si on l'appelle de n'importe où)
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
TEMPLATE_DIR="$SCRIPT_DIR/template"
TARGET_DIR="documentation"
FORCE=false
FILES_TO_COPY=("documentation.md" "specification.md")

# Traitement des arguments supplémentaires
    while [[ $# -gt 1 ]]; do
      key="$2"
      case $key in
        --name)
          TARGET_DIR="$3"
          shift 2
          ;;
        --force)
          FORCE=true
          shift
          ;;
        --template)
          IFS=',' read -ra FILES_TO_COPY <<< "$3"
          shift 2
          ;;
        *)
          echo "❌ Option inconnue : $key"
          echo "👉 Utilisez 'gdoc --help' pour voir les options disponibles."
          exit 1
          ;;
      esac
    done

    # Gérer le cas où le dossier existe
    if [ -d "$TARGET_DIR" ]; then
        if [ "$FORCE" = true ]; then
            echo "⚠️ Suppression du dossier existant '$TARGET_DIR' (option --force activée)"
            rm -rf "$TARGET_DIR"
        else
            echo "❌ Le dossier '$TARGET_DIR' existe déjà. Utilisez --force pour l’écraser."
            exit 1
        fi
    fi

# Créer le dossier
mkdir "$TARGET_DIR"

# Copier les fichiers spécifiés
for file in "${FILES_TO_COPY[@]}"; do
  if [ -f "$TEMPLATE_DIR/$file" ]; then
    cp "$TEMPLATE_DIR/$file" "$TARGET_DIR/"
    echo "✅ $file copié dans '$TARGET_DIR/'"
  else
    echo "⚠️ Le fichier '$file' n'existe pas dans le template. Ignoré."
  fi
done

echo "Dossier '$TARGET_DIR' généré avec succès."

echo "Documentation générée avec succès dans le dossier : '$TARGET_DIR'"
    ;;
    --help|-h)
      echo -e "Utilisation de gdoc :"
      echo -e "  gdoc init [options]"
      echo -e ""
      echo -e "  Options disponibles :"
      echo -e "    --name NOM          Nom du dossier à générer (par défaut : documentation)"
      echo -e "    --force             Écrase le dossier s’il existe déjà"
      echo -e "    --template f1,f2    Choix des fichiers à copier (ex : documentation.md,specification.md)"
      echo -e "  Exemples :"
      echo -e "    gdoc init"
      echo -e "    gdoc init --name mon_dossier"
      echo -e "    gdoc init --force"
      echo -e "    gdoc init --template documentation.md,specification.md"
      echo -e ""
      echo -e "  Autres commandes :"
      echo -e "    gdoc --version      Affiche la version actuelle"
      echo -e "    gdoc --uninstall    Supprime la commande gdoc"
      echo -e "    gdoc --help         Affiche cette aide"
      ;;
    --version|-v)
      echo "gdoc version $VERSION"
      ;;
    --uninstall)
      echo "❗ Suppression de la commande 'gdoc'..."
      sudo rm -f /usr/local/bin/gdoc
      echo "✅ La commande 'gdoc' a été désinstallée."
      ;;
  *)
    echo "Commande inconnue : '$COMMAND'"
    echo "Utilisez 'gdoc --help' pour afficher les options disponibles."
    ;;
esac
