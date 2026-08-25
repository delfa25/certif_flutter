import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const SettingsScreen({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Utilisateur'),
            accountEmail: Text('contact@filmopedia.com'),
            currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
          ),
          SwitchListTile(
            title: const Text('Mode Sombre'),
            secondary: const Icon(Icons.dark_mode),
            value: isDarkMode,
            onChanged: (value) {
              onToggleTheme();
            },
          ),
          ListTile(
            title: const Text('À propos'),
            leading: const Icon(Icons.info),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Filmopedia',
                applicationVersion: '1.0.0',
              );
            },
          ),
        ],
      ),
    );
  }
}
