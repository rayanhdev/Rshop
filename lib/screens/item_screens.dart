import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../models/item_models.dart';
import '../widgets/buttons/custom_size_buttons.dart';

class ItemDetailsPage extends StatefulWidget {
  final Item item;

  ItemDetailsPage({required this.item});

  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  int quantity = 1;
  bool _isPressed = false;

  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];

  final CarouselController _carouselController = CarouselController();
  int _currentImageIndex = 0;

  List<Widget> carouselItems = [
    Image.network(
      'https://img.freepik.com/vecteurs-libre/creation-logo-local-magasin-dessine-main_23-2149575766.jpg?w=2000',
      fit: BoxFit.cover,
    ),
    Image.network(
      'https://img.freepik.com/vecteurs-libre/creation-logo-local-magasin-dessine-main_23-2149575766.jpg?w=2000',
      fit: BoxFit.cover,
    ),
    Image.network(
      'https://img.freepik.com/vecteurs-libre/creation-logo-local-magasin-dessine-main_23-2149575766.jpg?w=2000',
      fit: BoxFit.cover,
    ),
  ];

  late Color selectedColor = colors[0];

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _togglePressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                    arguments: 1,
                  );
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: Column(
              children: [
                CarouselSlider(
                  items: carouselItems,
                  options: CarouselOptions(
                    height: 250.0,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < carouselItems.length; i++)
                      Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentImageIndex == i
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16.0, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.item.brand,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Center(
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: decrementQuantity,
                          icon: Icon(Icons.remove),
                        ),
                        Text(
                          '$quantity',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          onPressed: incrementQuantity,
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, bottom: 10),
                      child: Text(
                        'Size',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Row(
                      children: [
                        CustomButton(
                          text: 'S',
                          onPressed: () {
                            // Action pour le bouton S
                          },
                        ),
                        SizedBox(width: 10),
                        CustomButton(
                          text: 'M',
                          onPressed: () {
                            // Action pour le bouton M
                          },
                        ),
                        SizedBox(width: 10),
                        CustomButton(
                          text: 'L',
                          onPressed: () {
                            // Action pour le bouton L
                          },
                        ),
                        SizedBox(width: 10),
                        CustomButton(
                          text: 'XL',
                          onPressed: () {
                            // Action pour le bouton XL
                          },
                        ),
                        SizedBox(width: 10),
                        CustomButton(
                          text: 'XXL',
                          onPressed: () {
                            // Action pour le bouton XXL
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              for (int i = 0; i < colors.length; i++)
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedColor = colors[i];
                                      });
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: colors[i],
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: selectedColor == colors[i]
                                            ? Colors.white
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                      child: Scrollbar(
                    child: ListView(
                      padding: EdgeInsets.all(1),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Text(
                              'Votre texte long provenant des données ici',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            // Ajoutez d'autres widgets ici si nécessaire
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '\$128',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Logique du bouton ici
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
