import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:certif_flutter/main.dart';
import 'package:certif_flutter/providers/catalog_provider.dart';

void main() {
  testWidgets('App smoke test: Check if Catalogue title exists', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CatalogProvider(),
        child: const MyApp(),
      ),
    );

    // Verify that the AppBar title is correct
    expect(find.text('Filmopedia'), findsOneWidget);

    // Verify that the search bar is present
    expect(find.byType(TextField), findsOneWidget);

    // Verify that the FAB is present
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
