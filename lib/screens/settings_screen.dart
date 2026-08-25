import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/catalog_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catalogProvider = Provider.of<CatalogProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Utilisateur Démo'),
            accountEmail: Text('demo@filmopedia.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.indigo),
            ),
          ),
          SwitchListTile(
            title: const Text('Mode Sombre'),
            subtitle: const Text('Activer le thème sombre manuellement'),
            secondary: const Icon(Icons.brightness_4),
            value: catalogProvider.themeMode == ThemeMode.dark,
            onChanged: (bool value) {
              catalogProvider.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Thème Système'),
            trailing: catalogProvider.themeMode == ThemeMode.system 
              ? const Icon(Icons.check, color: Colors.green) 
              : null,
            onTap: () => catalogProvider.setThemeMode(ThemeMode.system),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('À propos de Filmopedia'),
            subtitle: const Text('Version 1.1.0'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Filmopedia',
                applicationVersion: '1.1.0',
                applicationLegalese: '© 2023-2024 Filmopedia Inc.',
                applicationIcon: const FlutterLogo(),
              );
            },
          ),
        ],
      ),
    );
  }
}
