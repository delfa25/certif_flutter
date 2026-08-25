import 'package:go_router/go_router.dart';
import '../models/item.dart';
import '../screens/list_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/add_item_screen.dart';
import '../screens/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ListScreen(),
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
