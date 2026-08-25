# 🎬 Filmopedia — Application Flutter Multi-écrans (V1.1)

Filmopedia est une application mobile & tablette moderne développée en **Flutter**. Elle permet de parcourir un catalogue de films, d'effectuer des recherches, de consulter des détails et d'ajouter de nouveaux films.

Cette version améliore l'architecture initiale en introduisant une gestion d'état robuste avec **Provider**, des tests unitaires et de widgets, ainsi qu'une expérience utilisateur enrichie.

---

## 🚀 Améliorations Récentes (V1.1)

- 🏗️ **Architecture State Management (Provider)** : Migration du stockage local vers un `CatalogProvider` pour une gestion d'état réactive et propre, éliminant les mutations d'état global non contrôlées.
- 🧪 **Couverture de Tests** : Ajout d'une suite de tests unitaires pour la logique métier (`CatalogProvider`) et de tests de widgets pour l'interface utilisateur.
- 🌓 **Paramètres Avancés** : Écran de paramètres enrichi permettant le contrôle précis du thème (Clair, Sombre, Système).
- ✨ **Expérience UI/UX** : 
  - Ajout d'animations `Hero` pour les transitions d'images.
  - Indicateurs de chargement et gestion des erreurs d'images dans `CustomCard`.
  - Meilleure gestion des débordements de texte pour la responsivité.
- 📦 **Modèle de Données Immuable** : Ajout du pattern `copyWith` au modèle `Item`.

---

## 📱 Aperçu des 4 Écrans

1.  **Catalogue (Liste)** : Grille responsive avec recherche en temps réel et basculement rapide de thème.
2.  **Détails du Film** : Informations complètes avec transition fluide.
3.  **Ajout de Film** : Formulaire complet avec validation stricte sur 3 champs.
4.  **Paramètres** : Gestion du profil et préférences de thème.

---

## 🛠️ Stack Technique

- **Navigation** : `GoRouter` (Routes nommées).
- **State Management** : `Provider` (Pattern ChangeNotifier).
- **Tests** : `flutter_test` (Unit tests & Widget tests).
- **Responsivité** : `LayoutBuilder` & `GridView`.
- **Thème** : Material 3 (Color Scheme Seed).

---

## 📁 Structure du Projet

```text
lib/
├── providers/       # NOUVEAU : Gestion d'état (CatalogProvider)
├── models/          # Modèles de données (Item avec copyWith)
├── router/          # Configuration GoRouter
├── screens/         # Écrans (List, Detail, Add, Settings)
├── widgets/         # Composants réutilisables (CustomCard, etc.)
├── theme/           # Thèmes Material 3
└── main.dart        # Point d'entrée avec MultiProvider
```

---

## ⚙️ Instructions de lancement

1. S'assurer que Flutter est installé.
2. Exécuter `flutter pub get`.
3. Pour lancer les tests : `flutter test`.
4. Pour lancer l'app : `flutter run`.
