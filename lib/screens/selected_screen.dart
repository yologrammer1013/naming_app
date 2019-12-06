import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'package:naming_app/providers/likedWords.dart';

class SelectedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected words'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Consumer<LikedWords>(
      builder: (context, value, child) => ListView.builder(
          itemCount: value.getLikedWords().length * 2,
          itemBuilder: (context, index) {
            if (index.isOdd) {
              return Divider();
            }
            var realIndex = index ~/ 2;
            var likedWords = Provider.of<LikedWords>(context).getLikedWords().toList();
            return _buildItem(likedWords[realIndex], context);
          }),
    );
  }

  Widget _buildItem(WordPair pair, BuildContext context) {
    return ListTile(
      title: Text(pair.asPascalCase, textScaleFactor: 1.5),
      onTap: () {
        Provider.of<LikedWords>(context).addOrRemoveWord(pair);
      },
    );
  }
}
