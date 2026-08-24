import 'package:flutter_test/flutter_test.dart';
import 'package:certif_flutter/providers/catalog_provider.dart';
import 'package:certif_flutter/models/item.dart';
import 'package:flutter/material.dart';

void main() {
  group('CatalogProvider Tests', () {
    test('Initial items list should not be empty', () {
      final provider = CatalogProvider();
      expect(provider.items.isNotEmpty, true);
    });

    test('Adding an item should increase the list length', () {
      final provider = CatalogProvider();
      final initialCount = provider.items.length;
      
      final newItem = Item(
        id: 'test_id',
        title: 'Test Movie',
        category: 'Action',
        rating: 9.5,
        description: 'Test description',
        imageUrl: 'test_url',
      );
      
      provider.addItem(newItem);
      
      expect(provider.items.length, initialCount + 1);
      expect(provider.items.last.title, 'Test Movie');
    });

    test('Theme toggle should change theme mode', () {
      final provider = CatalogProvider();
      provider.setThemeMode(ThemeMode.light);
      
      provider.toggleTheme();
      expect(provider.themeMode, ThemeMode.dark);
      
      provider.toggleTheme();
      expect(provider.themeMode, ThemeMode.light);
    });
  });
}
