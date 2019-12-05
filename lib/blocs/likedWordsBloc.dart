import 'dart:async';
import 'package:english_words/english_words.dart';

class LikedWordsBloc {
  Set<WordPair> liked_words = Set<WordPair>();

  final controller = StreamController<Set<WordPair>>.broadcast();

  get likedWordsStream => controller.stream;

  get addCurrentLikedWords => controller.sink.add(liked_words);

  addToOrRemoveList(WordPair item) {
    if(liked_words.contains(item)) {
      liked_words.remove(item);
    } else {
      liked_words.add(item);
    }

    controller.sink.add(liked_words);
  }

  dispose() {
    controller.close();
  }

}

var likedWordsBloc = LikedWordsBloc();