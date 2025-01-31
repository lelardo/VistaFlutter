import 'package:flutter/material.dart';class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  const CustomButton({Key? key, required this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(icon),
      ),
    );
  }
}