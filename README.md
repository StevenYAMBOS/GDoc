# gdoc

`gdoc` est un outil en ligne de commande simple et léger, écrit en **Bash**, permettant de générer automatiquement un dossier de documentation contenant plusieurs fichiers `Markdown` prédéfinis.
Il s’adresse aux développeurs, rédacteurs techniques ou équipes souhaitant structurer rapidement la documentation d’un projet.

---

## Installation

```bash
git clone https://github.com/votre-utilisateur/gdoc.git
cd gdoc
./setup.sh
```

> ⚠️ Nécessite `bash` et les droits sudo pour installer la commande globalement dans `/usr/local/bin`.

---

## Utilisation

```bash
gdoc init [options]
```

### Par défaut

```bash
gdoc init
```

Crée un dossier `documentation` avec les fichiers `documentation.md` et `specification.md`.

---

### Options disponibles

| Option                  | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `--name NOM`           | Personnalise le nom du dossier à générer                                    |
| `--force`              | Écrase le dossier s’il existe déjà                                           |
| `--template f1,f2`     | Spécifie les fichiers Markdown à copier depuis le dossier `template/`        |

---

### Exemples

```bash
gdoc init --name docs
gdoc init --force
gdoc init --template documentation.md,specification.md
gdoc init --template specification.md --name spec_folder --force
```

---

## Autres commandes

```bash
gdoc --version     # Affiche la version actuelle
gdoc --help        # Affiche l'aide détaillée
gdoc --uninstall   # Supprime la commande gdoc de votre système
```

---

## 🙌 Contribuer

Les contributions sont les bienvenues ! N'hésitez pas à proposer des améliorations, corriger des bugs ou ajouter de nouvelles fonctionnalités via une Pull Request.
