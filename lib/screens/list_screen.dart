import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:certif_flutter/data/dummy_data.dart';
import 'package:certif_flutter/models/item.dart';
import 'package:certif_flutter/widgets/custom_card.dart';
import 'package:certif_flutter/widgets/search_bar_input.dart';

class ListScreen extends StatefulWidget {
  final VoidCallback? onToggleTheme;
  const ListScreen({super.key, this.onToggleTheme});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Item> _filteredItems = dummyItems;

  void _filter(String query) {
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
        title: const Text('Catalogue'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
          if (widget.onToggleTheme != null)
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: widget.onToggleTheme,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SearchBarInput(onChanged: _filter),
            const SizedBox(height: 12),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2; // Responsive Mobile/Tablet
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.push<bool>('/add');
          if (result == true) {
            setState(() {
              _filteredItems = List.from(dummyItems);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
