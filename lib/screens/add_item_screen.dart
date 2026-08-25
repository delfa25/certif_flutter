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
  final _categoryController = TextEditingController();
  final _ratingController = TextEditingController();
  bool _isSaving = false;

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSaving = true);
      
      try {
        // Simulation d'un délai réseau pour montrer l'indicateur de chargement
        await Future.delayed(const Duration(milliseconds: 500));

        final newItem = Item(
          id: DateTime.now().toString(),
          title: _titleController.text,
          category: _categoryController.text,
          rating: double.parse(_ratingController.text),
          description: 'Nouveau film ajouté au catalogue.',
          imageUrl: 'https://picsum.photos/400/300?random=${DateTime.now().millisecond}',
        );

        FilmService().addFilm(newItem);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Film enregistré avec succès !')),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Titre', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Entrez un titre' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Catégorie', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Entrez une catégorie' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _ratingController,
                decoration: const InputDecoration(labelText: 'Note (0 à 10)', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Entrez une note';
                  final n = double.tryParse(value);
                  if (n == null || n < 0 || n > 10) return 'Note entre 0 et 10';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              _isSaving 
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _saveForm,
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                    child: const Text('Enregistrer'),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
