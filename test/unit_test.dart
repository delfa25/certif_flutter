import 'package:flutter_test/flutter_test.dart';
import 'package:certif_flutter/services/film_service.dart';
import 'package:certif_flutter/models/item.dart';

void main() {
  group('FilmService Tests', () {
    test('La recherche doit filtrer les films par titre', () {
      final service = FilmService();
      final results = service.searchFilms('Inception');
      expect(results.any((f) => f.title == 'Inception'), true);
    });

    test('Ajouter un film doit augmenter la taille de la liste', () {
      final service = FilmService();
      final initialCount = service.getAllFilms().length;
      
      service.addFilm(Item(
        id: '999',
        title: 'Test Movie',
        category: 'Test',
        rating: 5.0,
        description: 'Desc',
        imageUrl: 'url',
      ));
      
      expect(service.getAllFilms().length, initialCount + 1);
    });
  });
}
