# 🎬 Filmopedia — Projet Flutter Multi-écrans

Filmopedia est une application simple développée en **Flutter** pour gérer un catalogue de films. Ce projet respecte strictement les consignes de la certification.

---

## 🚀 Fonctionnalités Obligatoires

- **4 Écrans distincts** :
  1.  **Liste (Accueil)** : Grille de films avec recherche.
  2.  **Détail** : Informations sur le film sélectionné.
  3.  **Ajout** : Formulaire pour ajouter un film.
  4.  **Paramètres** : Gestion du thème et profil utilisateur.
- **Navigation GoRouter** : Utilisation de routes nommées.
- **Recherche & Filtrage** : Recherche par titre sur l'écran principal.
- **Formulaire avec Validation** : 3 champs requis (Titre, Catégorie, Note).
- **Thème Clair/Sombre** : Basculement possible depuis l'écran Paramètres.

---

## 🛠️ Exigences Techniques

- **Widgets utilisés (+8)** : `GridView`, `ListView`, `Stack`, `Card`, `TextField`, `Form`, `LayoutBuilder`, `InkWell`, `Image.network`.
- **Widgets Réutilisables** :
  1.  `CustomCard` (Carte du film).
  2.  `RatingBadge` (Badge de note).
  3.  `SearchBarInput` (Barre de recherche).
- **Responsive** : La grille s'adapte (2 colonnes sur mobile, 3 colonnes sur tablette).
- **Séparation Données/UI** : Les données sont stockées dans `lib/data/dummy_data.dart`.

---

## ⚙️ Instructions de lancement

1.  Installer Flutter.
2.  Exécuter `flutter pub get`.
3.  Lancer l'application avec `flutter run`.
