import 'package:flutter/material.dart';

import '../views/boutique_views.dart';

class ItemsPage extends StatefulWidget {
  final Product product;

  ItemsPage({required this.product});

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  bool _isFilterVisible = false;
  String _selectedFilter = 'Tous les articles';
  List<String> _filterOptions = [
    'Tous les articles',
    'Moins chers',
    'Plus chers',
    'Nouveautés',
    'Les plus aimés',
  ];

  List<Item> items = [
    Item(
        image: 'assets/vetements.jpg',
        title: 'Item 1',
        subtitle: 'Categoriede l\'item 1',
        price: '\$10'),
    Item(
        image: 'assets/vetements.jpg',
        title: 'Item 2',
        subtitle: 'Categoriede l\'item 2',
        price: '\$20'),
    Item(
        image: 'assets/vetements.jpg',
        title: 'Item 3',
        subtitle: 'Categoriede l\'item 3',
        price: '\$15'),
    Item(
        image: 'assets/vetements.jpg',
        title: 'Item 4',
        subtitle: 'Categoriede l\'item 4',
        price: '\$25'),
    Item(
        image: 'assets/vetements.jpg',
        title: 'Item 5',
        subtitle: 'Categoriede l\'item 5',
        price: '\$18'),
  ];

  List<Item> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items; // Afficher tous les articles par défaut
  }

  void applyFilter() {
    switch (_selectedFilter) {
      case 'Moins chers':
        filteredItems = items
            .where((item) => double.parse(item.price.substring(1)) < 20)
            .toList();
        break;
      case 'Plus chers':
        filteredItems = items
            .where((item) => double.parse(item.price.substring(1)) >= 20)
            .toList();
        break;
      case 'Nouveautés':
        filteredItems =
            items; // Ajoutez votre logique pour filtrer par nouveautés
        break;
      case 'Les plus aimés':
        filteredItems =
            items; // Ajoutez votre logique pour filtrer par les plus aimés
        break;
      default:
        filteredItems = items; // Afficher tous les articles par défaut
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Rechercher...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isFilterVisible = !_isFilterVisible;
                    });
                  },
                  icon: Icon(Icons.filter_list),
                ),
              ],
            ),
          ),
          if (_isFilterVisible)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Wrap(
                spacing: 8.0,
                children: _filterOptions.map((option) {
                  return FilterChip(
                    label: Text(option),
                    selected: _selectedFilter == option,
                    onSelected: (selected) {
                      setState(() {
                        _selectedFilter = option;
                        applyFilter();
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75
              ),
              itemCount: filteredItems.length,
            
              itemBuilder: (BuildContext context, int index) {
                final item = filteredItems[index];
                return Container(
                  color: Colors.transparent,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect( 
                          borderRadius: BorderRadius.circular(10),
                          child: FractionallySizedBox(
                            child: Image.asset(
                              item.image,
                              height: 170,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(item.subtitle),
                              Text(
                                item.price,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

class Item {
  final String image;
  final String title;
  final String subtitle;
  final String price;

  Item(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.price});
}
