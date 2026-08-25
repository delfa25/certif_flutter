import 'package:flutter_test/flutter_test.dart';
import 'package:certif_flutter/services/film_service.dart';
import 'package:certif_flutter/models/item.dart';

void main() {
  group('FilmService Unit Tests', () {
    late FilmService service;

    setUp(() {
      service = FilmService();
    });

    test('Le service doit être un Singleton', () {
      final service2 = FilmService();
      expect(service, same(service2));
    });

    test('Initialement, la liste ne doit pas être vide', () {
      final films = service.getAllFilms();
      expect(films.isNotEmpty, true);
    });

    test('La recherche doit filtrer les films par titre (insensible à la casse)', () {
      final results = service.searchFilms('inception');
      expect(results.any((f) => f.title.toLowerCase().contains('inception')), true);
    });

    test('La recherche avec une chaîne vide doit retourner tous les films', () {
      final allFilms = service.getAllFilms();
      final results = service.searchFilms('');
      expect(results.length, allFilms.length);
    });

    test('Ajouter un film doit augmenter la taille de la liste', () {
      final initialCount = service.getAllFilms().length;
      
      service.addFilm(Item(
        id: DateTime.now().toString(),
        title: 'Nouveau Film Test',
        category: 'Action',
        rating: 9.9,
        description: 'Description de test',
        imageUrl: 'https://test.com/image.png',
      ));
      
      expect(service.getAllFilms().length, initialCount + 1);
      expect(service.getAllFilms().last.title, 'Nouveau Film Test');
    });

    test('La liste retournée par getAllFilms doit être immuable (non modifiable)', () {
      final films = service.getAllFilms();
      expect(() => films.add(Item(
        id: '1', title: 'T', category: 'C', rating: 1, description: 'D', imageUrl: 'U'
      )), throwsUnsupportedError);
    });
  });
}
