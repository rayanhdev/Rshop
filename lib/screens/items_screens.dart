import 'dart:ffi';

import 'package:flutter/material.dart';

import '../models/item_models.dart';
import '../views/boutique_views.dart';
import 'item_screens.dart';

class ItemsPage extends StatefulWidget {
  final Product product;

  ItemsPage({required this.product});

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  TextEditingController _searchController = TextEditingController();
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
      id: '1',
      title: 'nike 1',
      brand: 'Brand 1',
      price: 10.0,
      colorImagesMap: {
        'white': ['assets/vetements.jpg'],
      },
      description: 'Description of Item 1',
      sizeQuantityMap: {
        // Size-quantity associations
      },
      likeCount: 0,
      isLiked: false,
    ),
    Item(
      id: '2',
      title: 'lacoste 2',
      brand: 'Brand 2',
      price: 20.0,
      colorImagesMap: {
        'white': ['assets/vetements.jpg'],
      },
      description: 'Description of Item 2',
      sizeQuantityMap: {
        // Size-quantity associations
      },
      likeCount: 0,
      isLiked: false,
    ),
    Item(
      id: '3',
      title: 'adidas 3',
      brand: 'Brand 3',
      price: 15.0,
      colorImagesMap: {
        'white': ['assets/vetements.jpg'],
      },
      description: 'Description of Item 3',
      sizeQuantityMap: {
        // Size-quantity associations
      },
      likeCount: 0,
      isLiked: false,
    ),
    Item(
      id: '4',
      title: 'versace 4',
      brand: 'Brand 4',
      price: 25.0,
      colorImagesMap: {
        'white': ['assets/vetements.jpg'],
      },
      description: 'Description of Item 4',
      sizeQuantityMap: {
        // Size-quantity associations
      },
      likeCount: 0,
      isLiked: false,
    ),
    Item(
      id: '5',
      title: 'puma 5',
      brand: 'Brand 5',
      price: 18.0,
      colorImagesMap: {
        'white': ['assets/vetements.jpg'],
      },
      description: 'Description of Item 5',
      sizeQuantityMap: {
        // Size-quantity associations
      },
      likeCount: 0,
      isLiked: false,
    ),
  ];

  void _onSearchTextChanged() {
    setState(() {
      String searchText = _searchController.text.toLowerCase();
      filteredItems = items.where((item) {
        final title = item.title.toLowerCase();
        return title.contains(searchText);
      }).toList(); 
    });
  }

  List<Item> filteredItems = [];
  @override
  void dispose() {
    _searchController.removeListener(_onSearchTextChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
    filteredItems = items; // Afficher tous les articles par défaut
  }

  void applyFilter() {
    switch (_selectedFilter) {
      case 'Moins chers':
        filteredItems = List.from(items);
        filteredItems
            .sort((a, b) => a.price.compareTo(b.price)); // Sort the copied list
        break;
      case 'Plus chers':
        filteredItems = List.from(items); // Make a copy of the original list
        filteredItems.sort((a, b) => b.price
            .compareTo(a.price)); // Sort the copied list in descending order
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
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
                            controller: _searchController,
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors
                        .black, // Set the background color of the IconButton to black
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _isFilterVisible = !_isFilterVisible;
                      });
                    },
                    icon: Icon(
                      Icons.filter_list,
                      color: Colors.white, // Set the color of the icon to white
                    ),
                  ),
                )
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
                childAspectRatio: 0.75,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = filteredItems[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to the new page with item details
                    Navigator.pushNamed(context, '/item', arguments: item);
                  },
                  child: Container(
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
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FractionallySizedBox(
                                  child: Image.asset(
                                    items[0].colorImagesMap.values.first[0],
                                    height: 170,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 5,
                                  right: 2,
                                  child: Container(
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .black, // Set the background color of the IconButton to black
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          item.isLiked = !item.isLiked;
                                        });
                                      },
                                      icon: Icon(
                                        item.isLiked
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: item.isLiked
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                            ],
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
                                Text(item.brand),
                                Text(
                                  item.price.toString(),
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
