# 🗡️ **Zelda Compendium - Flutter Project** 📱

![Zelda Logo]([https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Triforce_of_the_Legend_of_Zelda.svg/1200px-Triforce_of_the_Legend_of_Zelda.svg.png](https://media.licdn.com/dms/image/v2/D4D03AQETaeSNg9Q6tA/profile-displayphoto-shrink_200_200/B4DZS42ozXHYAg-/0/1738268119301?e=1766016000&v=beta&t=uyRGd9jAWANdS7F4-r7pgEmSVEM0tdXY5aQEViXu5eU))

## Description

**Zelda Compendium** est une application Flutter permettant de découvrir et interagir avec les données de l'univers de **The Legend of Zelda**. L'application utilise une API publique pour afficher des informations concernant les différents **monstres**, **animaux**, **objets** et **matériaux** présents dans le jeu **Breath of the Wild**.

Grâce à ce projet, l'objectif est de maîtriser la récupération de données depuis une API REST, la manipulation de données JSON, et l'affichage dynamique et interactif des informations. En outre, l'application propose une expérience fluide avec une interface responsive et des fonctionnalités modernes comme la gestion des favoris.

---

## Fonctionnalités

🌟 **Chargement des données depuis une API externe** : 
  - Récupération des informations du compendium de Zelda via une API REST.

📋 **Affichage dynamique des données** : 
  - Affichage des monstres, animaux, objets et matériaux avec leur image, nom, description, etc.

🔄 **Navigation par catégories** : 
  - Facilité de navigation entre différentes catégories (Monstres, Animaux, Équipements, Matériaux) grâce à un **Bottom Navigation Bar**.

🧳 **Gestion des favoris** : 
  - Ajout et suppression d'éléments favoris, avec sauvegarde locale via **SharedPreferences**.

⚡ **Splash Screen animé** : 
  - Un écran de démarrage interactif avec le logo de Zelda et un indicateur de chargement.

🚧 **Gestion de l'état** : 
  - Gestion des états de chargement et des erreurs avec des messages appropriés.

---

## Technologies Utilisées

- **Flutter** : Framework principal pour le développement mobile.
- **Dart** : Langage utilisé pour la programmation de l'application.
- **API REST** : Utilisation de l'API publique pour le compendium de Zelda.
- **HTTP** : Utilisation de la bibliothèque `http` pour effectuer des requêtes réseau.
- **CachedNetworkImage** : Gestion du cache pour les images issues des URL.
- **SharedPreferences** : Pour la gestion locale des favoris.
- **Material Design** : Interface utilisateur suivant les lignes directrices de Material Design.
- **JSON** : Manipulation des données au format JSON.

---

## Installation

### Prérequis

Avant de commencer, assurez-vous que Flutter est installé et configuré sur votre machine. Si ce n'est pas déjà fait, suivez la documentation officielle pour l'installation de Flutter :

[Installation de Flutter](https://flutter.dev/docs/get-started/install)

### Cloner le dépôt

Clonez le projet et entrez dans le répertoire du projet :

```bash
git clone https://github.com/votre-nom/utilisateur/zelda-compendium-flutter.git
cd zelda-compendium-flutter
