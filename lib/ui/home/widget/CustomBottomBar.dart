import 'package:flutter/material.dart';
import 'package:mioconfluter/ui/home/HomeScreen.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 1;

  void _onItemTapped(int index, BuildContext context) {
    if (index == 0) {
      Scaffold.of(context).openDrawer(); // Abre el drawer
    } else if (index == 1 && ModalRoute.of(context)?.settings.name != HomeScreen.routeName) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false,
      );
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
      selectedItemColor: Color(0xff4d623a),
      unselectedItemColor: Colors.black,
      onTap: (index) => _onItemTapped(index, context),
    );
  }
}