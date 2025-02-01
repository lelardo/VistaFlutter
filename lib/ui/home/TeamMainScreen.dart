import 'package:flutter/material.dart';
import 'package:mioconfluter/models/TeamClone.dart';
import 'package:mioconfluter/ui/home/TeamItemScreen.dart';
import 'package:mioconfluter/ui/home/widget/SimpleAppBar.dart';

class TeamMainScreen extends StatefulWidget {
  final List<TeamClone> teams;

  TeamMainScreen({required this.teams, Key? key}) : super(key: key);

  @override
  _TeamMainScreenState createState() => _TeamMainScreenState();
}

class _TeamMainScreenState extends State<TeamMainScreen> {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, top: 20, bottom: 20),
            child: Text(
              "Equipos",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: widget.teams.length,
                itemBuilder: (context, index) {
                  final team = widget.teams[index];
                  return MouseRegion(
                    onEnter: (_) => setState(() => hoveredIndex = index),
                    onExit: (_) => setState(() => hoveredIndex = null),
                    child: Card(
                      elevation: 6,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      shadowColor: hoveredIndex == index ? Color(0xFFBBFA63) : Colors.black26,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(team.logo),
                          backgroundColor: Colors.transparent,
                        ),
                        title: Text(
                          team.name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[600]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeamItemScreen(team: team),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}