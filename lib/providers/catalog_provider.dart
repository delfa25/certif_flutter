import 'package:flutter/material.dart';
import '../models/item.dart';
import '../data/dummy_data.dart';

class CatalogProvider with ChangeNotifier {
  final List<Item> _items = List.from(dummyItems);
  ThemeMode _themeMode = ThemeMode.system;

  List<Item> get items => List.unmodifiable(_items);
  ThemeMode get themeMode => _themeMode;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
