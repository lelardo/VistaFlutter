import 'package:flutter/material.dart';
import 'ProfileCard.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Ajustar el padding
              child: Expanded(
                child: ProfileCard(
                  name: 'John Doe',
                  imageUrl: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQP5QQKcY4t1-_XAOvt_5Ii9LGJqTDX0B7u5sOZJFeU8QCGJ2jReifGEDftXkScCw-lMm8nmFUYF2QXwMR2KrzTsw',
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.black),
            title: Text('Home', style: TextStyle(color: Colors.black)),
            onTap: () {
              // Acción al tocar
            },
          ),
          ListTile(
            leading: Icon(Icons.sports_soccer, color: Colors.black),
            title: Text('Competencias', style: TextStyle(color: Colors.black)),
            onTap: () {
              // Acción al tocar
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, color: Colors.black),
            title: Text('Calendario', style: TextStyle(color: Colors.black)),
            onTap: () {
              // Acción al tocar
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            title: Text('Settings', style: TextStyle(color: Colors.black)),
            onTap: () {
              // Acción al tocar
            },
          ),
        ],
      ),
    );
  }
}