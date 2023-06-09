import 'package:flutter/material.dart';

class Item {
  final String id;
  final String title;
  final String brand;
  final double price;
  final Map<String, List<String>> colorImagesMap;
  final String description;
  final Map<String, int> sizeQuantityMap;
  final int likeCount;
  bool isLiked;

  Item({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    required this.colorImagesMap,
    required this.description,
    required this.sizeQuantityMap,
    required this.likeCount,
    required this.isLiked,
  });
}