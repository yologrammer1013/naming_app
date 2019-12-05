import 'package:flutter/material.dart';
import 'package:naming_app/screens/list_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: ListScreen(),
    );
  }
}