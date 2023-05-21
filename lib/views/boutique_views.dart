import 'package:flutter/material.dart';

class Product {
  final String name;
  final String category;
  final int quantity;
  final String image;

  Product(
      {required this.name,
      required this.category,
      required this.quantity,
      required this.image});
}

class BoutiquePage extends StatelessWidget {
  final List<Product> products = [
    Product(
        name: 'Produit 1',
        category: 'Catégorie 1',
        quantity: 10,
        image: 'assets/images/vetement.jpg'),
    Product(
        name: 'Produit 2',
        category: 'Catégorie 2',
        quantity: 15,
        image: 'assets/images/vetement.jpg'),
    Product(
        name: 'Produit 3',
        category: 'Catégorie 1',
        quantity: 5,
        image: 'assets/images/vetement.jpg'),
    // Ajoutez d'autres produits ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Categories',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(products[index].image),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1.0, 
                crossAxisSpacing:
                    1.0, 
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: Container(
                    width: 80,
                    height: 80,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10.0),
                    //   image: DecorationImage(
                    //     image: AssetImage(products[index].image),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  ),
                  title: Text(products[index].name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(products[index].category),
                      Text('Disponible: ${products[index].quantity}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
