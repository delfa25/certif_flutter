import 'package:flutter/material.dart';
import '../models/item.dart';
import 'rating_badge.dart';

class CustomCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const CustomCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                item.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title, 
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.category, style: const TextStyle(fontSize: 12)),
                      RatingBadge(rating: item.rating), // Widget réutilisable 3
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
