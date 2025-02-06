import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mioconfluter/ui/home/TeamItemScreen.dart';
import 'dart:convert';

import 'package:mioconfluter/ui/home/TeamMainScreen.dart';

class TeamSectionHorizontalScroll extends StatefulWidget {
  final String title;

  const TeamSectionHorizontalScroll({Key? key, required this.title}) : super(key: key);

  @override
  _TeamSectionHorizontalScrollState createState() => _TeamSectionHorizontalScrollState();
}

class _TeamSectionHorizontalScrollState extends State<TeamSectionHorizontalScroll> {
  int? hoveredIndex;
  bool isTitleHovered = false;
  List<dynamic> teams = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchTeams();
  }

  Future<void> fetchTeams() async {
    final url = 'http://172.23.64.1:8000/api/teams/';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          teams = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFBBFA63);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => isTitleHovered = true),
          onExit: (_) => setState(() => isTitleHovered = false),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeamMainScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: isTitleHovered
                    ? BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.6),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                )
                    : null,
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : hasError
              ? Center(child: Text('Error al cargar equipos'))
              : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: teams.length,
            itemBuilder: (context, index) {
              final team = teams[index];
              return MouseRegion(
                onEnter: (_) => setState(() => hoveredIndex = index),
                onExit: (_) => setState(() => hoveredIndex = null),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeamItemScreen(teamId: index+1),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: hoveredIndex == index ? primaryColor : Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.network(
                              team['logo'],
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Icon(
                                Icons.image_not_supported,
                                size: 120,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          team['name'],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
