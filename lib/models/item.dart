class Item {
  final String id;
  final String title;
  final String category;
  final double rating;
  final String description;
  final String imageUrl;

  const Item({
    required this.id,
    required this.title,
    required this.category,
    required this.rating,
    required this.description,
    required this.imageUrl,
  });

  Item copyWith({
    String? id,
    String? title,
    String? category,
    double? rating,
    String? description,
    String? imageUrl,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
