import 'package:flutter/material.dart';
import 'package:mioconfluter/ui/home/widget/CustomBottomBar.dart';
import 'widget/SimpleAppBar.dart';
import 'widget/HeaderWidget.dart';
import 'widget/InfoCard.dart';
import 'widget/RuleItem.dart';
import 'widget/SingleChoice.dart';
import 'package:mioconfluter/ui/home/widget/CustomDrawer.dart';

class CompetenceItemScreen extends StatefulWidget {
  @override
  _CompetenceItemScreenState createState() => _CompetenceItemScreenState();
}

class _CompetenceItemScreenState extends State<CompetenceItemScreen> {
  InfoOptions selectedOption = InfoOptions.mainInfo;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SimpleAppBar(),
      drawer: CustomDrawer(),

      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  title: 'Competencia XYZ',
                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV-SUEhCLO68dZGhZaASDUWNT0DFufkxuWNA&s',
                ),
                SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChoice(
                      selectedOption: selectedOption,
                      onOptionChanged: (InfoOptions newOption) {
                        setState(() {
                          selectedOption = newOption;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                if (selectedOption == InfoOptions.mainInfo) ...[
                  InfoCard(title: 'Disciplina', content: 'Fútbol'),
                  InfoCard(title: 'Fecha de Registro', content: '01/01/2023'),
                  InfoCard(title: 'Formato', content: 'Eliminación directa'),
                  InfoCard(title: 'Descripción', content: 'Competencia de fútbol a nivel nacional.'),
                  InfoCard(title: 'Reglas', content: ''),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(15, (index) {
                      return RuleItem(
                        title: 'Regla ${index + 1}',
                        index: index + 1,
                      );
                    }),
                  ),
                ] else ...[
                  Text('Ediciones anteriores...'),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10, // Número de elementos en la lista
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // Acción al tocar el elemento
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.all(16.0),
                          margin: EdgeInsets.symmetric(vertical: 4.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Nombre del elemento ${index + 1}'),
                              Text('Fecha: 01/01/2023'),
                            ],
                          ),
                        ),
                        onHighlightChanged: (isHighlighted) {
                          setState(() {
                            // Cambia el tamaño del contenedor cuando se hace clic
                            if (isHighlighted) {
                              // Encoge el contenedor
                            } else {
                              // Restaura el tamaño original
                            }
                          });
                        },
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: isHovered ? 150 : 56,
                height: 56,
                child: FloatingActionButton.extended(
                  backgroundColor: Color(0xFFb9ff66),
                  onPressed: () {
                    // Acción al presionar el botón flotante
                  },
                  label: isHovered ? Text('Agregar regla', style: TextStyle(color: Colors.black)) : Container(),
                  icon: Icon(Icons.add, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}