import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/dummy_data.dart';
import '../models/item.dart';
import '../widgets/custom_card.dart';
import '../widgets/search_bar_input.dart';

class ListScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const ListScreen({super.key, required this.onToggleTheme});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // Liste filtrée pour la recherche
  List<Item> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = dummyItems;
  }

  // Fonction de recherche simple
  void _filterItems(String query) {
    setState(() {
      _filteredItems = dummyItems
          .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmopedia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Widget réutilisable 1
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBarInput(onChanged: _filterItems),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Responsive : 2 colonnes sur mobile, 3 sur tablette (largeur > 600)
                int columns = constraints.maxWidth > 600 ? 3 : 2;
                
                return GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: _filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = _filteredItems[index];
                    // Widget réutilisable 2
                    return CustomCard(
                      item: item,
                      onTap: () => context.push('/detail', extra: item),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Attendre le retour de l'écran d'ajout pour rafraîchir la liste
          await context.push('/add');
          setState(() {
            _filteredItems = dummyItems;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
