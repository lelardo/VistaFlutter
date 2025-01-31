import 'package:flutter/material.dart';
import 'package:mioconfluter/models/GridItemData.dart';

class SectionGrid extends StatelessWidget {
  final List<GridItemData> items;

  const SectionGrid({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              // Acción al hacer clic en el elemento
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
                  image: NetworkImage(items[index].imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    items[index].title,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}