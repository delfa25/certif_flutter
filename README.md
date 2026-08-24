# 🎬 Filmopedia — Application Flutter Multi-écrans

Filmopedia est une application mobile & tablette moderne développée en **Flutter** permettant de parcourir un catalogue de films, d'effectuer des recherches en temps réel, de consulter les détails de chaque œuvre et d'ajouter de nouveaux films via un formulaire validé.

Ce projet a été conçu en respectant l'architecture Clean Code, avec une séparation stricte entre les données et l'interface utilisateur, une gestion complète de la navigation réactive via `go_router`, ainsi qu'un support natif du mode Sombre / Clair et du design Responsive.

---

## 🚀 Fonctionnalités Clés

- 📱 **Navigation Avancée (GoRouter 2.0)** : Navigation déclarative par routes nommées et passage d'objets complexes entre les écrans.
- 🔍 **Recherche & Filtrage en temps réel** : Filtrage dynamique des films par titre au fur et à mesure de la saisie.
- 📐 **Layout Responsive (Mobile & Tablette)** : Adaptation automatique de la grille (`GridView.builder` & `LayoutBuilder`) selon la largeur d'écran (2 colonnes sur smartphone, 3+ colonnes sur tablette).
- 📝 **Formulaire d'Ajout avec Validation** : Validation côté client sur 3 champs requis (Titre, Catégorie, Note sur 10).
- 🌓 **Support Thème Clair / Sombre** : Définition de palettes personnalisées basées sur Material 3.
- 🧩 **Composants Réutilisables** : Conception modulaire avec widgets autonomes dans le dossier `widgets/`.

---

## 📱 Aperçu des 4 Écrans

1.  **Écran de Liste (Catalogue)** : Affiche les films sous forme de grille responsive avec une barre de recherche.
2.  **Écran de Détail** : Affiche les informations complètes d'un film sélectionné (Image, Description, Note).
3.  **Écran de Formulaire (Ajout)** : Permet d'ajouter un nouveau film avec validation des données.
4.  **Écran de Paramètres (Settings)** : Affiche les informations utilisateur et les détails de l'application.

---

## 🛠️ Widgets et Architecture Technique

### Widgets Flutter utilisés (+8)
- `GridView.builder` (Liste responsive)
- `ListView` (Formulaire et Paramètres)
- `Stack` & `Positioned` (Badge sur image)
- `Card` & `InkWell` (Design des éléments)
- `TextFormField` & `Form` (Validation)
- `SingleChildScrollView` (Détails scrollables)
- `LayoutBuilder` (Responsivité)
- `Chip` (Catégories)
- `UserAccountsDrawerHeader` (Profil utilisateur)

### Widgets Réutilisables (`lib/widgets/`)
1. **`CustomCard`** : Carte d'affichage d'un film.
2. **`RatingBadge`** : Badge stylisé pour la note.
3. **`SearchBarInput`** : Champ de recherche avec icône.

---

## 📁 Structure du Projet

```text
lib/
├── data/
│   └── dummy_data.dart      # Séparation UI/Données
├── models/
│   └── item.dart            # Modèle Item
├── router/
│   └── app_router.dart      # Configuration GoRouter
├── screens/
│   ├── add_item_screen.dart # Formulaire (Validation 3 champs)
│   ├── detail_screen.dart   # Détail (Passage paramètres)
│   ├── list_screen.dart     # Liste (Recherche/Filtrage)
│   └── settings_screen.dart # 4ème écran (Settings)
├── theme/
│   └── app_theme.dart       # Thème Clair/Sombre
└── main.dart                # Point d'entrée
```

## ⚙️ Instructions de lancement

1. S'assurer que Flutter est installé (`flutter doctor`).
2. Cloner le repository.
3. Exécuter `flutter pub get` à la racine.
4. Lancer l'application avec `flutter run`.
