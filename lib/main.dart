import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mioconfluter/ui/home/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo ',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.white,
          onPrimary: Colors.black,
          secondary: Colors.grey[200]!,
          onSecondary: Colors.black,
        ),
        textTheme: GoogleFonts.spaceGroteskTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Arial'),
        ),
      ),
      home: const MyHomePage(title: 'SportBoard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}