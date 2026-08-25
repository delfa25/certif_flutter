# 🎬 Filmopedia — Application Flutter Certifiée

Filmopedia est une application de gestion de catalogue de films développée avec **Flutter**. Ce projet démontre la maîtrise des concepts fondamentaux : navigation complexe, gestion d'état, architecture logicielle propre, responsivité et tests automatisés.

---

## 🏗️ Architecture du Projet

Le projet suit une architecture **Layer-First** (par couches), favorisant la séparation des responsabilités et la maintenance du code.

```text
lib/
├── data/           # Données brutes et constantes (Source de vérité initiale)
│   └── dummy_data.dart
├── models/         # Modèles de données (Classes Item/Film)
│   └── item.dart
├── services/       # Logique métier et accès aux données (Service Pattern)
│   └── film_service.dart
├── screens/        # Écrans principaux de l'application (UI de haut niveau)
│   ├── list_screen.dart        # Catalogue avec recherche
│   ├── detail_screen.dart      # Détails du film
│   ├── add_item_screen.dart    # Formulaire avec validation
│   └── settings_screen.dart    # Paramètres et Thème
├── widgets/        # Composants UI réutilisables et atomiques
│   ├── custom_card.dart
│   ├── rating_badge.dart
│   └── search_bar_input.dart
├── theme/          # Configuration visuelle (Styles Material 3)
│   └── app_theme.dart
├── router/         # Définition des routes et navigation (GoRouter)
│   └── app_router.dart
└── main.dart       # Point d'entrée de l'application
```

---

## 🛠️ Détails Techniques et Choix d'Implémentation

### 1. Navigation & Routage
*   **GoRouter** : Utilisation du package `go_router` pour une gestion déclarative des routes.
*   **Passage de paramètres** : Les données complexes sont transmises via l'attribut `extra` des routes, évitant ainsi des appels répétés aux services.

### 2. Gestion des Données (Service Pattern)
*   **Singleton Pattern** : Le `FilmService` est implémenté en tant que Singleton pour garantir une instance unique des données à travers toute l'application.
*   **Découplage** : L'UI communique uniquement avec le service, jamais directement avec la liste de données brute (`dummyItems`).

### 3. Interface Utilisateur (UI/UX)
*   **Responsivité** : Utilisation de `LayoutBuilder` pour calculer dynamiquement le nombre de colonnes du `GridView` (2 sur Mobile, 3 sur Tablette/Desktop).
*   **Feedback Visuel** : 
    *   `CircularProgressIndicator` lors de la simulation d'enregistrement.
    *   Gestion des erreurs d'images via `errorBuilder`.
    *   SnackBars pour confirmer les actions utilisateur.
*   **Thème** : Support complet du mode Clair et Sombre via `ThemeMode` et `Material3`.

### 4. Qualité Logicielle & Automatisation
*   **Tests Unitaires** : Tests de la logique du service dans `test/unit_test.dart` (recherche, ajout).
*   **Tests de Widgets** : Validation de l'existence des éléments clés de l'interface dans `test/widget_test.dart`.
*   **CI/CD (GitHub Actions)** : Pipeline configuré pour exécuter `flutter test` à chaque Push ou Pull Request, garantissant la non-régression du code.

---

## ⚙️ Exigences Techniques Remplies

| Critère | Détail |
| :--- | :--- |
| **Widgets (+8)** | GridView, ListView, Stack, Card, Form, TextFormField, LayoutBuilder, CircularProgressIndicator, InkWell, Hero. |
| **Widgets Réutilisables** | CustomCard, RatingBadge, SearchBarInput. |
| **Validation Formulaire** | 3 champs (Titre, Catégorie, Note) avec expressions régulières et vérification de types. |
| **Navigation** | Routes nommées via GoRouter. |

---

## 🚀 Instructions de lancement

1.  **Clonage** : `git clone <url-du-repo>`
2.  **Dépendances** : `flutter pub get`
3.  **Lancement des Tests** : `flutter test`
4.  **Exécution** : `flutter run`
