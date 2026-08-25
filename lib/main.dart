import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:certif_flutter/router/app_router.dart';
import 'package:certif_flutter/theme/app_theme.dart';
import 'package:certif_flutter/providers/catalog_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CatalogProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final catalogProvider = Provider.of<CatalogProvider>(context);

    return MaterialApp.router(
      title: 'Filmopedia',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: catalogProvider.themeMode,
      routerConfig: appRouter,
    );
  }
}
