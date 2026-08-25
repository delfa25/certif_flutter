import '../models/item.dart';
import '../data/dummy_data.dart';

/// Interface pour le service de films afin d'améliorer la testabilité et respecter les principes SOLID.
abstract class IFilmService {
  List<Item> getAllFilms();
  void addFilm(Item item);
  List<Item> searchFilms(String query);
}

class FilmService implements IFilmService {
  // Instance unique (Singleton)
  static final FilmService _instance = FilmService._internal();
  factory FilmService() => _instance;
  FilmService._internal();

  final List<Item> _films = List.from(dummyItems);

  @override
  List<Item> getAllFilms() {
    return List.unmodifiable(_films);
  }

  @override
  void addFilm(Item item) {
    _films.add(item);
  }

  @override
  List<Item> searchFilms(String query) {
    if (query.isEmpty) return List.unmodifiable(_films);
    return _films
        .where((film) => film.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
