import 'package:flutter/material.dart';
import 'package:naming_app/screens/list_screen.dart';
import 'package:provider/provider.dart';
import 'package:naming_app/providers/likedWords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<LikedWords> (
        create: (_) => LikedWords(),
        child: MaterialApp(
          home: ListScreen(),
        )
    );
  }
}