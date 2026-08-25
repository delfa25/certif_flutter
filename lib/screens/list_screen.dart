import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item.dart';
import '../widgets/custom_card.dart';
import '../widgets/search_bar_input.dart';
import '../services/film_service.dart';

class ListScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const ListScreen({super.key, required this.onToggleTheme});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final FilmService _filmService = FilmService();
  List<Item> _displayItems = [];
  String _currentQuery = '';

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  void _refreshList() {
    setState(() {
      _displayItems = _filmService.searchFilms(_currentQuery);
    });
  }

  void _onSearch(String query) {
    _currentQuery = query;
    _refreshList();
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: SearchBarInput(onChanged: _onSearch),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Adaptabilité : colonnes et marges selon la largeur
                int columns = constraints.maxWidth > 600 ? 3 : 2;
                double padding = constraints.maxWidth > 600 ? 16.0 : 8.0;

                if (_displayItems.isEmpty) {
                  return const Center(child: Text('Aucun film trouvé.'));
                }

                return GridView.builder(
                  padding: EdgeInsets.all(padding),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _displayItems.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      item: _displayItems[index],
                      onTap: () => context.push('/detail', extra: _displayItems[index]),
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
          await context.push('/add');
          _refreshList();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
