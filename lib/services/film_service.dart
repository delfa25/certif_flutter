import '../models/item.dart';
import '../data/dummy_data.dart';

class FilmService {
  // Instance unique (Singleton) pour accéder aux données partout
  static final FilmService _instance = FilmService._internal();
  factory FilmService() => _instance;
  FilmService._internal();

  final List<Item> _films = List.from(dummyItems);

  List<Item> getAllFilms() {
    return _films;
  }

  void addFilm(Item item) {
    _films.add(item);
  }

  List<Item> searchFilms(String query) {
    if (query.isEmpty) return _films;
    return _films
        .where((film) => film.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
