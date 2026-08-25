# 🎬 Filmopedia — Application Flutter Certifiée (Version Excellence)

Filmopedia est une application mobile et tablette complète développée avec **Flutter**. Ce projet a été conçu pour répondre aux exigences les plus strictes de certification, en mettant l'accent sur la qualité du code, l'architecture et les tests.

---

## ✅ État du Projet
- **Navigation** : 4 écrans distincts fonctionnels (Catalogue, Détail, Ajout, Paramètres).
- **Architecture** : Clean architecture (Service Pattern avec abstraction).
- **Tests** : Couverture complète (Unitaires & Widgets) avec 100% de succès.
- **CI/CD** : Pipeline automatisé pour les builds et les tests.
- **Responsivité** : Support multi-écrans (Mobile/Tablette) sur toutes les pages.

---

## 🏗️ Architecture Détaillée

Le projet suit une organisation **Layer-First** stricte pour séparer l'interface utilisateur de la logique métier :

```text
lib/
├── models/         # Modèles de données immuables.
├── services/       # Abstractions et implémentations des services (IFilmService).
├── screens/        # Pages de l'application (UI de haut niveau).
├── widgets/        # Composants atomiques réutilisables (Design System).
├── router/         # Configuration GoRouter (Navigation déclarative).
├── theme/          # Définition des thèmes Material 3 (Light/Dark).
└── data/           # Source de données initiale.
```

### Choix Techniques :
*   **Service Pattern & SOLID** : Utilisation d'une interface `IFilmService` pour découpler le code et faciliter le remplacement des données (mock vs API).
*   **Singleton Pattern** : Centralisation des données via une instance unique.
*   **Immuabilité** : Les listes renvoyées par les services sont non modifiables (`unmodifiable`) pour éviter les effets de bord.

---

## 🚀 Fonctionnalités Clés

1.  **Catalogue Responsive** : Utilisation de `LayoutBuilder` et `GridView.builder` pour adapter l'affichage (2 ou 3 colonnes).
2.  **Navigation Avancée** : Passage d'objets complexes via `go_router` et transitions fluides.
3.  **Formulaire Premium** : Validation multi-niveaux, menus déroulants (`DropdownButtonFormField`) et feedback haptique/visuel.
4.  **Thème Dynamique** : Basculement instantané entre mode clair et sombre via l'écran des paramètres.
5.  **Robustesse** : Gestion complète des erreurs (chargement d'images, validation, erreurs système).

---

## 🧪 Tests & Qualité

La fiabilité est assurée par deux suites de tests :
*   **Unit Tests** (`test/unit_test.dart`) : Validation de la logique métier, du filtrage et de l'immuabilité.
*   **Widget Tests** (`test/widget_test.dart`) : Validation de la navigation, du rendu UI et du flux de validation des formulaires.

```bash
flutter test  # Exécute l'intégralité de la suite de tests
```

---

## 📱 Aperçu (Screenshots)

| Catalogue | Détails | Ajout | Paramètres |
| :---: | :---: | :---: | :---: |
| ![Catalogue](https://via.placeholder.com/150) | ![Détails](https://via.placeholder.com/150) | ![Ajout](https://via.placeholder.com/150) | ![Paramètres](https://via.placeholder.com/150) |

---

## 🛠️ Installation et Lancement

1.  **Prérequis** : Flutter SDK stable installé.
2.  **Installation** : `flutter pub get`
3.  **Exécution** : `flutter run`
