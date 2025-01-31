import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String imageUrl;

  const HeaderWidget({Key? key, required this.title, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25, top: 0, bottom: 20), // Ajustar el padding
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}