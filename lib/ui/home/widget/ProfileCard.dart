import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const ProfileCard({Key? key, required this.name, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40, // Reducir el tamaño del avatar
          backgroundImage: NetworkImage(imageUrl),
        ),
        SizedBox(height: 8), // Reducir el espacio entre el avatar y el texto
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Reducir el tamaño del texto
        ),
      ],
    );
  }
}