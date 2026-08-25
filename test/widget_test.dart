import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:certif_flutter/main.dart';

void main() {
  testWidgets('Test de rendu de l\'écran principal', (WidgetTester tester) async {
    // Charger l'application
    await tester.pumpWidget(const MyApp());

    // Vérifier que le titre est affiché
    expect(find.text('Filmopedia'), findsOneWidget);

    // Vérifier la présence de la barre de recherche
    expect(find.byType(TextField), findsOneWidget);

    // Vérifier la présence du bouton d'ajout
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
