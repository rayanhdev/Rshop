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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                        _selectedFilter = selected ? option : 'Tous les articles';
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                // Afficher les éléments filtrés ici
                // Exemple d'élément :
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text('Élément'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}