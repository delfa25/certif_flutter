import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('À propos de Filmopedia'),
            subtitle: const Text('Version 1.0.0'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Filmopedia',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2023 Filmopedia Inc.',
                applicationIcon: const FlutterLogo(),
              );
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Cette application a été développée pour démontrer la maîtrise de Flutter, incluant la navigation GoRouter, le design responsive, et la gestion des thèmes.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
