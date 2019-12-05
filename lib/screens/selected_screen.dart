import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SelectedScreen extends StatefulWidget {

  SelectedScreen({@required this.list});

  final Set<WordPair> list;

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
    return ListView.builder(
        itemCount: widget.list.length * 2,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return Divider();
          }
          var realIndex = index ~/ 2;

          return _buildItem(widget.list.toList()[realIndex]);
        });
  }

  Widget _buildItem(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase, textScaleFactor: 1.5),
      onTap: () {
        setState(() {
          widget.list.remove(pair);
        });
      },
    );
  }
}
