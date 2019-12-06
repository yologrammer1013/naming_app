import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';

class LikedWords with ChangeNotifier {

  Set<WordPair> _liked_words;

  LikedWords() {
    _liked_words = Set<WordPair>();
  }

  Set<WordPair> getLikedWords () {
    return _liked_words;
  }

  void addOrRemoveWord(WordPair pair) {
    if (_liked_words.contains(pair)) {
      _liked_words.remove(pair);
    } else {
      _liked_words.add(pair);
    }
    notifyListeners();
  }
}