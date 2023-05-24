class Item {
  final List<String>  image;
  final String title;
  final String subtitle;
  final String price;
  bool isLiked;

  Item(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.isLiked});
}
