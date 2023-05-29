import 'package:flutter/material.dart';

class Item {
  final String id;
  final double price;
  final Map<String, List<String>> colorImagesMap;
  final String description;
  final Map<String, int> sizeQuantityMap;
  final int likeCount;

  Item({
    required this.id,
    required this.price,
    required this.colorImagesMap,
    required this.description,
    required this.sizeQuantityMap,
    required this.likeCount,
  });
}