import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item.dart';
import '../services/film_service.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _ratingController = TextEditingController();
  String? _selectedCategory;
  bool _isSaving = false;

  final List<String> _categories = ['Action', 'Sci-Fi', 'Comédie', 'Drame', 'Horreur'];

  @override
  void dispose() {
    _titleController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSaving = true);
      
      try {
        await Future.delayed(const Duration(milliseconds: 500));

        final newItem = Item(
          id: DateTime.now().toString(),
          title: _titleController.text.trim(),
          category: _selectedCategory!,
          rating: double.parse(_ratingController.text),
          description: 'Nouveau film ajouté au catalogue avec succès.',
          imageUrl: 'https://picsum.photos/400/300?random=${DateTime.now().millisecond}',
        );

        FilmService().addFilm(newItem);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Film enregistré avec succès !'),
              backgroundColor: Colors.green,
            ),
          );
          context.pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erreur lors de l\'enregistrement.')),
          );
        }
      } finally {
        if (mounted) setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nouveau Film')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double horizontalPadding = constraints.maxWidth > 600 ? 150 : 20;

          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 24),
              children: [
                Text(
                  'Ajouter un nouveau film',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Titre du film',
                    prefixIcon: Icon(Icons.movie),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return 'Le titre est obligatoire';
                    if (value.trim().length < 2) return 'Titre trop court';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'Catégorie',
                    prefixIcon: Icon(Icons.category),
                    border: OutlineInputBorder(),
                  ),
                  items: _categories.map((cat) {
                    return DropdownMenuItem(value: cat, child: Text(cat));
                  }).toList(),
                  onChanged: (value) => setState(() => _selectedCategory = value),
                  validator: (value) => value == null ? 'Veuillez choisir une catégorie' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _ratingController,
                  decoration: const InputDecoration(
                    labelText: 'Note (0.0 à 10.0)',
                    prefixIcon: Icon(Icons.star),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'La note est obligatoire';
                    final n = double.tryParse(value);
                    if (n == null) return 'Entrez un nombre valide';
                    if (n < 0 || n > 10) return 'La note doit être entre 0 et 10';
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                _isSaving
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          ElevatedButton(
                            onPressed: _saveForm,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text('Enregistrer le film', style: TextStyle(fontSize: 16)),
                          ),
                          TextButton(
                            onPressed: () => context.pop(),
                            child: const Text('Annuler', style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
