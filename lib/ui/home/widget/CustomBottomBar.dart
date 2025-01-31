import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 1;

  void _onItemTapped(int index, BuildContext context) {
    if (index == 0) {
      Scaffold.of(context).openDrawer(); // Abre el drawer
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.black,
      onTap: (index) => _onItemTapped(index, context),
    );
  }
}
