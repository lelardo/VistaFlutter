import 'package:flutter/material.dart';
import 'package:mioconfluter/models/TeamClone.dart';
import 'widget/SimpleAppBar.dart';
import 'widget/HeaderWidget.dart';
import 'widget/InfoCard.dart';
import 'widget/SingleChoice.dart';
import 'package:mioconfluter/ui/home/widget/CustomDrawer.dart';
import 'package:mioconfluter/ui/home/widget/CustomBottomBar.dart';

class TeamItemScreen extends StatefulWidget {
  final TeamClone team;

  TeamItemScreen({required this.team});

  @override
  _TeamItemScreenState createState() => _TeamItemScreenState();
}

class _TeamItemScreenState extends State<TeamItemScreen> {
  InfoOptions selectedOption = InfoOptions.mainInfo;

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SimpleAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              title: widget.team.name,
              imageUrl: widget.team.logo,
            ),
            SizedBox(height: 16),
            Center(
              child: ClipRRect(
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
            ),
            SizedBox(height: 16),
            if (selectedOption == InfoOptions.mainInfo) ...[
              InfoCard(title: 'País', content: widget.team.country),
            ] else ...[
              Text('Plantillas:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.team.squads.length,
                itemBuilder: (context, index) {
                  final squad = widget.team.squads[index];
                  return MouseRegion(
                    onEnter: (_) => setState(() {}),
                    onExit: (_) => setState(() {}),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFBBFA63).withOpacity(0.6),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text('Plantilla ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${formatDate(squad.footballSeason.fechaInicio)} - ${formatDate(squad.footballSeason.fechaFin)}'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}