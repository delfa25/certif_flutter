import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/dummy_data.dart';
import '../models/item.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Contrôleurs pour récupérer le texte
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  final _ratingController = TextEditingController();

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // Création d'un nouvel objet Item
      final newItem = Item(
        id: DateTime.now().toString(),
        title: _titleController.text,
        category: _categoryController.text,
        rating: double.parse(_ratingController.text),
        description: 'Nouveau film ajouté au catalogue.',
        imageUrl: 'https://picsum.photos/400/300?random=${DateTime.now().millisecond}',
      );

      // Ajout à la liste globale (simple pour un débutant)
      dummyItems.add(newItem);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Film enregistré !')),
      );
      
      context.pop(); // Retour à la liste
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
                decoration: const InputDecoration(labelText: 'Titre'),
                validator: (value) => value!.isEmpty ? 'Entrez un titre' : null,
              ),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Catégorie'),
                validator: (value) => value!.isEmpty ? 'Entrez une catégorie' : null,
              ),
              TextFormField(
                controller: _ratingController,
                decoration: const InputDecoration(labelText: 'Note (0 à 10)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return 'Entrez une note';
                  if (double.tryParse(value) == null) return 'Nombre invalide';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
