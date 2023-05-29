import 'package:flutter/material.dart';

import '../views/boutique_views.dart';
import '../views/profile_views.dart';
import '../views/panier_views.dart';

class HomePage extends StatefulWidget {
  final int? initialIndex; 
  HomePage({this.initialIndex});
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;

  final List<Widget> _views = [
    BoutiquePage(),
    PanierPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Boutique',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
