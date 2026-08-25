import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:certif_flutter/main.dart';
import 'package:certif_flutter/screens/list_screen.dart';
import 'package:certif_flutter/widgets/search_bar_input.dart';

void main() {
  group('Widget Tests - Filmopedia', () {
    testWidgets('L\'écran principal doit afficher les éléments clés', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Vérifier le titre de l'Appbar
      expect(find.text('Filmopedia'), findsOneWidget);

      // Vérifier la présence du champ de recherche
      expect(find.byType(SearchBarInput), findsOneWidget);

      // Vérifier la présence du FloatingActionButton
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('Navigation vers l\'écran Paramètres', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Cliquer sur l'icône des paramètres
      final settingsButton = find.byIcon(Icons.settings);
      expect(settingsButton, findsOneWidget);
      await tester.tap(settingsButton);
      await tester.pumpAndSettle();

      // Vérifier qu'on est sur l'écran des paramètres
      expect(find.text('Paramètres'), findsOneWidget);
      expect(find.text('Mode Sombre'), findsOneWidget);
    });

    testWidgets('Navigation vers l\'écran d\'ajout', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Cliquer sur le FAB
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Vérifier qu'on est sur l'écran d'ajout
      expect(find.text('Nouveau Film'), findsOneWidget);
      expect(find.byType(TextFormField), findsAtLeastNWidgets(2));
    });

    testWidgets('Validation du formulaire d\'ajout', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Tenter d'enregistrer sans rien remplir
      await tester.tap(find.text('Enregistrer le film'));
      await tester.pump();

      // Vérifier l'apparition des messages d'erreur
      expect(find.text('Le titre est obligatoire'), findsOneWidget);
      expect(find.text('Veuillez choisir une catégorie'), findsOneWidget);
    });
  });
}
