import 'package:flutter/material.dart';
import 'pages/ag_page.dart';
import 'pages/nachhilfe_page.dart';
import 'pages/vertretungs_page.dart';
import 'pages/news_page.dart';
import 'pages/account_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SchoolDex V1',
      home: Newspage(),
      routes: {
        Nachhilfepage.routeName: (ctx) => Nachhilfepage(),
        AGPage.routeName: (ctx) => AGPage(),
        Newspage.routeName: (ctx) => Newspage(),
        Vertretungspage.routeName: (ctx) => Vertretungspage(),
        Accountpage.routeName: (ctx) => Accountpage()
      },
    );
  }
}
