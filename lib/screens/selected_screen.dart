import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:naming_app/blocs/likedWordsBloc.dart';

class SelectedScreen extends StatefulWidget {

  @override
  _SelectedScreenState createState() => _SelectedScreenState();
}

class _SelectedScreenState extends State<SelectedScreen> {
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
    return StreamBuilder<Set<WordPair>>(
      stream: likedWordsBloc.likedWordsStream,
      builder: (context, snapshot) {
        var liked_words = Set<WordPair>();

        if (snapshot.hasData) {
          liked_words.addAll(snapshot.data);
        } else {
          likedWordsBloc.addCurrentLikedWords;
        }

        return ListView.builder(
            itemCount: liked_words.length * 2,
            itemBuilder: (context, index) {
              if (index.isOdd) {
                return Divider();
              }
              var realIndex = index ~/ 2;

              return _buildItem(snapshot.data.toList()[realIndex]);
            });
      }
    );
  }

  Widget _buildItem(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase, textScaleFactor: 1.5),
      onTap: () {
        likedWordsBloc.addToOrRemoveList(pair);
      },
    );
  }
}
