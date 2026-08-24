import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:certif_flutter/models/item.dart';
import 'package:certif_flutter/data/dummy_data.dart';

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

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newItem = Item(
        id: DateTime.now().toString(),
        title: _titleController.text,
        category: _categoryController.text,
        rating: double.parse(_ratingController.text),
        description: "Élément ajouté manuellement au catalogue.",
        imageUrl: 'https://picsum.photos/400/300?random=${DateTime.now().millisecond}',
      );

      dummyItems.add(newItem);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Élément ajouté avec succès !')),
      );
      context.pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un élément')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Titre'),
                validator: (v) => v == null || v.isEmpty ? 'Entrez un titre' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Catégorie'),
                validator: (v) => v == null || v.isEmpty ? 'Entrez une catégorie' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _ratingController,
                decoration: const InputDecoration(labelText: 'Note (0 - 10)'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Entrez une note';
                  final num = double.tryParse(v);
                  if (num == null || num < 0 || num > 10) return 'Note invalide (0 à 10)';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 