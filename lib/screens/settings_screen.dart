import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const SettingsScreen({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Centrage du contenu si l'écran est large (Tablette)
          double horizontalPadding = constraints.maxWidth > 600 ? 100 : 16;

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo),
                accountName: Text('Utilisateur Certifié'),
                accountEmail: Text('certification@flutter.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.indigo, size: 40),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Préférences',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('Mode Sombre'),
                subtitle: const Text('Activer le thème sombre de l\'application'),
                secondary: const Icon(Icons.dark_mode),
                value: isDarkMode,
                onChanged: (value) {
                  onToggleTheme();
                },
              ),
              ListTile(
                title: const Text('Langue'),
                subtitle: const Text('Français'),
                leading: const Icon(Icons.language),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
              const SizedBox(height: 30),
              Text(
                'Informations',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Divider(),
              ListTile(
                title: const Text('Version de l\'application'),
                subtitle: const Text('1.2.0 (Stable)'),
                leading: const Icon(Icons.info_outline),
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationName: 'Filmopedia',
                    applicationVersion: '1.2.0',
                    applicationIcon: const FlutterLogo(),
                    applicationLegalese: 'Projet Flutter pour certification.',
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Déconnexion réussie')),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red[50]),
                child: const Text('Se déconnecter', style: TextStyle(color: Colors.red)),
              ),
            ],
          );
        },
      ),
    );
  }
}
