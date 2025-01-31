import 'package:flutter/material.dart';
import 'package:mioconfluter/ui/home/widget/HeaderWidget.dart';
import 'package:mioconfluter/ui/home/widget/SectionHorizontalScroll.dart';
import 'package:mioconfluter/ui/home/widget/CustomBottomBar.dart';
import 'package:mioconfluter/ui/home/widget/MainAppBar.dart';
import 'package:mioconfluter/ui/home/CompetencesMainScreen.dart';
import 'package:mioconfluter/ui/home/CompetenceItemScreen.dart';
import 'package:mioconfluter/ui/home/widget/CustomDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(showMenuIcon: false),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderWidget(
              title: 'Competencias y Disciplinas',
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV-SUEhCLO68dZGhZaASDUWNT0DFufkxuWNA&s',
            ),
            SectionHorizontalScroll(
              title: 'Competencias',
              imageUrls: [
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz7w6sBObowDnsE6HDNxWHxUcF47IvAwmP00M6OR1S8Jzos2zQUvSU1s7wYgJtsjmExug&usqp=CAU",
                "https://static.vecteezy.com/system/resources/previews/044/626/807/non_2x/copa-america-usa-2024-logo-on-transparent-background-free-vector.jpg",
                "https://static.vecteezy.com/system/resources/previews/044/626/807/non_2x/copa-america-usa-2024-logo-on-transparent-background-free-vector.jpg",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz7w6sBObowDnsE6HDNxWHxUcF47IvAwmP00M6OR1S8Jzos2zQUvSU1s7wYgJtsjmExug&usqp=CAU",
                "https://static.vecteezy.com/system/resources/previews/044/626/807/non_2x/copa-america-usa-2024-logo-on-transparent-background-free-vector.jpg",
                "https://static.vecteezy.com/system/resources/previews/044/626/807/non_2x/copa-america-usa-2024-logo-on-transparent-background-free-vector.jpg",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz7w6sBObowDnsE6HDNxWHxUcF47IvAwmP00M6OR1S8Jzos2zQUvSU1s7wYgJtsjmExug&usqp=CAU",
                "https://static.vecteezy.com/system/resources/previews/044/626/807/non_2x/copa-america-usa-2024-logo-on-transparent-background-free-vector.jpg",
                "https://static.vecteezy.com/system/resources/previews/044/626/807/non_2x/copa-america-usa-2024-logo-on-transparent-background-free-vector.jpg",
              ],
              destination: CompetencesMainScreen(),
            ),
            SectionHorizontalScroll(
              title: 'Disciplinas',
              imageUrls: [
                "https://static.vecteezy.com/system/resources/previews/036/493/504/non_2x/soccer-logo-design-illustration-vector.jpg",
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/logo-design-template-bcd87d9e826b5e24ca60772ee556314c_screen.jpg?ts=1664810304",
                "https://static.vecteezy.com/system/resources/previews/021/944/723/non_2x/sport-athletics-run-logo-design-illustration-on-white-background-vector.jpg",
                "https://static.vecteezy.com/system/resources/previews/036/493/504/non_2x/soccer-logo-design-illustration-vector.jpg",
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/logo-design-template-bcd87d9e826b5e24ca60772ee556314c_screen.jpg?ts=1664810304",
                "https://static.vecteezy.com/system/resources/previews/021/944/723/non_2x/sport-athletics-run-logo-design-illustration-on-white-background-vector.jpg",
                "https://static.vecteezy.com/system/resources/previews/036/493/504/non_2x/soccer-logo-design-illustration-vector.jpg",
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/logo-design-template-bcd87d9e826b5e24ca60772ee556314c_screen.jpg?ts=1664810304",
                "https://static.vecteezy.com/system/resources/previews/021/944/723/non_2x/sport-athletics-run-logo-design-illustration-on-white-background-vector.jpg",
              ],
              destination: CompetenceItemScreen(),
            ),
            SectionHorizontalScroll(
              title: 'Equipos',
              imageUrls: [
                "https://static.vecteezy.com/system/resources/previews/036/493/504/non_2x/soccer-logo-design-illustration-vector.jpg",
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/logo-design-template-bcd87d9e826b5e24ca60772ee556314c_screen.jpg?ts=1664810304",
                "https://static.vecteezy.com/system/resources/previews/021/944/723/non_2x/sport-athletics-run-logo-design-illustration-on-white-background-vector.jpg",
                "https://static.vecteezy.com/system/resources/previews/036/493/504/non_2x/soccer-logo-design-illustration-vector.jpg",
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/logo-design-template-bcd87d9e826b5e24ca60772ee556314c_screen.jpg?ts=1664810304",
                "https://static.vecteezy.com/system/resources/previews/021/944/723/non_2x/sport-athletics-run-logo-design-illustration-on-white-background-vector.jpg",
                "https://static.vecteezy.com/system/resources/previews/036/493/504/non_2x/soccer-logo-design-illustration-vector.jpg",
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/logo-design-template-bcd87d9e826b5e24ca60772ee556314c_screen.jpg?ts=1664810304",
                "https://static.vecteezy.com/system/resources/previews/021/944/723/non_2x/sport-athletics-run-logo-design-illustration-on-white-background-vector.jpg",
              ],
              destination: CompetenceItemScreen(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}