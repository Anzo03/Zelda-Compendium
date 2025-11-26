# Zelda Compendium - Flutter Project

## Description

**Zelda Compendium** est une application Flutter qui utilise une API externe pour afficher et interagir avec les données relatives à l'univers de **The Legend of Zelda**. L'application récupère les informations d'un **compendium** de Zelda à travers une API publique, permettant à l'utilisateur de naviguer, filtrer, et afficher des données concernant des **monstres**, des **animaux**, des **objets** et **matériaux** dans le jeu.

L'objectif principal de ce projet est d'apprendre à manipuler des API RESTful, récupérer des données JSON, et gérer l'affichage de ces données de manière intuitive et réactive. L'application permet également de trier les données par catégorie et d'ajouter des fonctionnalités interactives pour une meilleure expérience utilisateur.

## Fonctionnalités

- **Chargement des données depuis une API externe** : Utilisation de l'API de Zelda pour récupérer des informations sur différents éléments du jeu.
- **Affichage dynamique des données** : Affichage de données sous forme de liste avec des images et des descriptions pour chaque élément (monstre, animal, objet, matériau, etc.).
- **Navigation par catégories** : Le projet permet de naviguer facilement entre les différentes catégories de données comme les monstres, animaux, équipements, et matériaux grâce à une barre de navigation inférieure.
- **Gestion de l'état** : L'application gère le changement d'état lors du chargement des données, et affiche des messages d'erreur ou des indications de chargement lorsqu'aucune donnée n'est disponible.
- **Splash Screen avec logo animé** : Un écran de démarrage (Splash Screen) avec un logo et un indicateur de chargement est montré à l'utilisateur pendant le chargement initial des données.

## Technologies Utilisées

- **Flutter** : Framework utilisé pour créer l'application mobile.
- **Dart** : Langage de programmation utilisé pour le développement de l'application.
- **API REST** : Utilisation d'une API REST pour récupérer les données sur le compendium de Zelda.
- **HTTP** : Utilisation de la bibliothèque `http` pour effectuer des requêtes réseau.
- **CachedNetworkImage** : Pour la gestion des images en cache et l'affichage d'images à partir d'URLs.
- **Material Design** : Utilisation des composants Material Design pour l'interface utilisateur.
- **JSON** : Manipulation des données au format JSON provenant de l'API.

## Installation

### Prérequis

Avant de commencer, assurez-vous d'avoir installé Flutter et configuré votre environnement de développement. Vous pouvez suivre la documentation officielle de Flutter pour cela :

- [Installation de Flutter](https://flutter.dev/docs/get-started/install)

### Cloner le dépôt

```bash
git clone https://github.com/votre-nom/utilisateur/zelda-compendium-flutter.git
cd zelda-compendium-flutter
