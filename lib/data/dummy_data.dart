import 'package:certif_flutter/models/item.dart';

final List<Item> dummyItems = [
  const Item(
    id: '1',
    title: 'Inception',
    category: 'Sci-Fi',
    rating: 8.8,
    description: 'Un voleur qui s\'infiltre dans les rêves...',
    imageUrl: 'https://picsum.photos/400/300?random=1',
  ),
  const Item(
    id: '2',
    title: 'Interstellar',
    category: 'Sci-Fi',
    rating: 8.7,
    description: 'Un voyage à travers un trou de ver...',
    imageUrl: 'https://picsum.photos/400/300?random=2',
  ),
  const Item(
    id: '3',
    title: 'The Dark Knight',
    category: 'Action',
    rating: 9.0,
    description: 'Batman affronte le Joker à Gotham...',
    imageUrl: 'https://picsum.photos/400/300?random=3',
  ),
];
