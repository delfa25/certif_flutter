import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:certif_flutter/models/item.dart';
import 'package:certif_flutter/screens/list_screen.dart';
import 'package:certif_flutter/screens/detail_screen.dart';
import 'package:certif_flutter/screens/add_item_screen.dart';

import '../screens/settings_screen.dart';

GoRouter createRouter(VoidCallback onToggleTheme) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => ListScreen(onToggleTheme: onToggleTheme),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          final item = state.extra as Item;
          return DetailScreen(item: item);
        },
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => const AddItemScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
