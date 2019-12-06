import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:naming_app/screens/selected_screen.dart';
import 'package:provider/provider.dart';
import 'package:naming_app/providers/likedWords.dart';

class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListScreenState();
  }
}

class ListScreenState extends State<ListScreen> {
  final List<WordPair> _random_words = <WordPair>[];
  final Set<WordPair> _liked_words = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final randomWord = WordPair.random();

    return Scaffold(
        appBar: AppBar(
          title: Text("List of random words"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SelectedScreen(); // call by reference
                }));
              },
            ),
          ],
        ),
        body: _buildList()
    );
  }

  _buildList() {

    return ListView.builder(itemBuilder: (context, index) {
      if (index.isOdd) {
        return Divider();
      }
      var realIndex = index ~/ 2;

      if (realIndex >= _random_words.length) {
        _random_words.addAll(generateWordPairs().take(10));
      }

      return buildItem(_random_words[realIndex], context);
    });
  }

  Widget buildItem(WordPair pair, BuildContext context) {
    // final bool isLiked = _liked_words.contains(pair);
    final bool isLiked = Provider.of<LikedWords>(context).getLikedWords().contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase, textScaleFactor: 1.5),
      trailing: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
          color: Colors.pink),
      onTap: () {
        Provider.of<LikedWords>(context, listen: false).addOrRemoveWord(pair);
      },
    );
  }
}
