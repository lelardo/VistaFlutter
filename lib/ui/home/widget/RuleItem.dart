import 'package:flutter/material.dart';

class RuleItem extends StatelessWidget {
  final String title;
  final int index;

  RuleItem({required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Acción al tocar la regla
        print('Regla $index tocada');
      },
      onLongPress: () {
        // Acción al mantener presionada la regla
        print('Regla $index mantenida');
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 1.0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFFb9ff66),
                child: Text(
                  '$index',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(width: 16),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}