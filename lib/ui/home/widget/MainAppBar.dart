import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showMenuIcon;

  const MainAppBar({Key? key, this.showMenuIcon = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: showMenuIcon
          ? IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}