import 'package:flutter/material.dart';

class SectionHorizontalScroll extends StatelessWidget {
  final String title;
  final List<String> imageUrls;
  final Widget destination;

  const SectionHorizontalScroll(
      {Key? key,
        required this.title,
        required this.imageUrls,
        required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25, top: 30, bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destination),
              );
            },
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: imageUrls.map((url) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // Acción al hacer clic
                  },
                  onLongPress: () {
                    // Acción al mantener presionado
                  },
                  highlightColor: Colors.blue.withOpacity(0.3),
                  splashColor: Colors.blue.withOpacity(0.5),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}