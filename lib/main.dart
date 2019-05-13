import 'package:flutter/material.dart';
import 'package:planning_poker/card_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planning Poker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent
      ),
      home: CardListPage(),
    );
  }
}
