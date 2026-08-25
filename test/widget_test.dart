import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:certif_flutter/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Vérifie que le titre est présent
    expect(find.text('Filmopedia'), findsOneWidget);

    // Vérifie que le bouton d'ajout est là
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
