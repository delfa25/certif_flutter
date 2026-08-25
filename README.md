# 🎬 Filmopedia — Application Flutter Certifiée (Version Finale)

Filmopedia est une application mobile et tablette complète développée avec **Flutter**. Ce projet valide l'ensemble des compétences requises pour la certification : architecture propre, navigation avancée, gestion d'état, responsivité, et tests automatisés.

---

## ✅ État du Projet
- **Fonctionnalités** : 100% Implémentées.
- **Qualité** : 100% des tests passent (`flutter test`).
- **CI/CD** : Pipeline GitHub Actions opérationnel (Build & Tests automatiques).
- **Responsivité** : Interface adaptative Mobile/Tablette.

---

## 🏗️ Architecture Technique (Service Pattern)

Le projet utilise une séparation stricte des responsabilités pour garantir la maintenabilité :

- **Services** : Le `FilmService` centralise la gestion des données (Singleton).
- **Models** : Objets métiers typés (`Item`).
- **Screens** : UI découpée en 4 écrans distincts.
- **Widgets** : Composants atomiques réutilisables.
- **Router** : Navigation déclarative avec `go_router`.

```text
lib/
├── services/   # Logique de données (FilmService)
├── screens/    # List, Detail, Add, Settings
├── widgets/    # CustomCard, RatingBadge, SearchBarInput
├── models/     # Item model
├── router/     # GoRouter configuration
└── theme/      # Material 3 Light/Dark themes
```

---

## 🚀 Fonctionnalités Clés

1.  **Catalogue Dynamique** : Grille responsive avec filtrage en temps réel par titre.
2.  **Navigation Nommée** : Passage d'objets complexes entre écrans via `go_router`.
3.  **Formulaire Validé** : Ajout de films avec validation stricte (Titre, Catégorie, Note 0-10).
4.  **Thème Adaptatif** : Basculement manuel ou système entre mode Clair et Sombre.
5.  **Performance** : Chargement optimisé des images avec indicateurs de progression et gestion d'erreurs.

---

## 🧪 Tests & Qualité

Le projet inclut une suite de tests garantissant la stabilité de l'application :

*   **Tests Unitaires** : Validation du moteur de recherche et de l'ajout de données.
*   **Tests de Widgets** : Vérification de l'intégrité de l'interface utilisateur.
*   **Analyse Statique** : Code propre sans avertissements (`flutter analyze` OK).

---

## 🛠️ Installation et Lancement

### Prérequis
- Flutter SDK (dernière version stable)
- Un émulateur ou appareil physique

### Commandes
1.  **Récupérer les dépendances** :
    ```bash
    flutter pub get
    ```
2.  **Lancer les tests** :
    ```bash
    flutter test
    ```
3.  **Démarrer l'application** :
    ```bash
    flutter run
    ```

---

## 📱 Aperçu
*(Insérez vos captures d'écran ici pour une présentation optimale)*
- 📱 **Mobile** : Grille 2 colonnes.
- 💻 **Tablette** : Grille 3 colonnes.
