# Documentation <nom_du_projet>

Écrit le : **01//01/1970**

Par : **Un beau gosse**

## Organisation du dépot

### Branches dépot

L'organisation des branches dans <github_ou_gitlab> est structurée pour faciliter le développement, les tests, et le déploiement en production. Voici les principales branches utilisées :

- **`dev`** :  
  La branche principale de développement continu. Elle sert d'environnement bac à sable pour les développeurs où toutes les nouvelles fonctionnalités et corrections de bugs sont intégrées après validation initiale.

- **`pre-prod`** :  
  Cette branche est destinée à présenter les fonctionnalités au client. Une fois que les développements de la branche `dev` sont stabilisés et validés, ils sont fusionnés dans cette branche pour des démonstrations.

- **`prod`** :  
  La branche finale de production qui contient la version stable et prête à être déployée de l'application. Elle est mise à jour uniquement lorsque les changements dans `pre-prod` sont entièrement validés.

- **`feat/nom_de_fonctionnalité`** :  
  Des branches éphémères créées pour le développement d'une fonctionnalité spécifique. Ces branches sont fusionnées dans la branche `dev` une fois les développements terminés et validés.

### Bonnes pratiques

- Toujours nommer les branches fonctionnelles avec le préfixe `feat/` suivi d'une description claire de la fonctionnalité (par exemple, `feat/authentication`).
- Tester les fonctionnalités dans la branche `dev` avant de les intégrer dans `pre-prod`.
- Ne jamais effectuer de développement direct sur les branches `pre-prod` et `prod`.
- Maintenir la branche `prod` uniquement avec du code stable et prêt pour les utilisateurs finaux.

## Technologies

- ![Bash Script](https://img.shields.io/badge/bash_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

Vous trouverez les badges des technologie ici -> [markdown-badges](https://github.com/Ileriayo/markdown-badges)

## Base de données

- Nom : <nom>
- Les tables sont au singulier
- Les tables de jointure sont au pluriel
- Etc...

### Tables

#### Table `user`

Table des utilisateurs de l'application.

```sql
id: UUID Primary key Identity Unique Non-Nullable
company_id : UUID Non-Nullable
email: VARCHAR Unique Non-Nullable
first_name: VARCHAR Non-Nullable
last_name: VARCHAR Non-Nullable
profile_picture: VARCHAR Nullable
status: VARCHAR Non-Nullable
created_at: TIMESTAMP Non-Nullable
```

Explications des champs :

- `id` : UUID de l'utilisateur.
- `company_id` : Entreprise à laquelle appartient l'utilisateur.
- `email` : Adresse email.
- `first_name` : Prénom.
- `last_name` : Nom de famille.
- `profile_picture` : Image de profil de l'utilisateur.
- `status` : Statut de l'utilisateur :
   -> `Superamdin` = Auditeur externe
   -> `Admin` = Utilisateur admin/responsable
   -> `User` = Utilisateur lambda
- `created_at` : Date de création de la colonne.

Quand un utilisateur est créé il est également ajouté à la table de jointure `company_users`.

### Tables de jointure

#### Table `company_users`

Gérer la relation entre les entreprises et les utilisateurs.

```sql
create table company_users (
  id bigint primary key generated always as identity,
  company_id uuid not null references company (id) on delete cascade,
  user_id uuid not null references user (uid) on delete cascade,
  created_at timestamp not null default now(),
  unique (company_id, user_id)
);
```

- `company_id` : Référence une entreprise dans la table `company`.
- `user_id` : Référence un utilisateur dans la table `user`.
- `created_at` : Date d'ajout de l'utilisateur à l'entreprise.

## Installation

### Installer les dépendances

```shell
# exemple : npm install
```

### Installation et configuration

Créer un fichier `.env` à la racine du projet (au même niveau que le fichier `exemple.json` par exemple) et ajouter les configurations **base_de_données**

```shell
EXEMPLE_ENV=""
```

## Lancement de l'application

```shell

```

Lancement de l'application avec <commande>