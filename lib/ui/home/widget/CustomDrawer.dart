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
              color: Color(0xFFb9ff66), // Color de la paleta
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
              child: ProfileCard(
                name: 'John Doe',
                imageUrl: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQP5QQKcY4t1-_XAOvt_5Ii9LGJqTDX0B7u5sOZJFeU8QCGJ2jReifGEDftXkScCw-lMm8nmFUYF2QXwMR2KrzTsw',
              ),
            ),
          ),
          _buildListTile(context, Icons.home, 'Home'),
          _buildListTile(context, Icons.sports_soccer, 'Competencias'),
          _buildListTile(context, Icons.calendar_today, 'Calendario'),
          _buildListTile(context, Icons.settings, 'Settings'),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title) {
    return MouseRegion(
      onEnter: (_) => _onHover(context, true),
      onExit: (_) => _onHover(context, false),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: TextStyle(color: Colors.black)),
          onTap: () {
            // Acción al tocar
          },
        ),
      ),
    );
  }

  void _onHover(BuildContext context, bool isHovering) {
    // Aquí puedes manejar el estado de hover si es necesario
  }
}