import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:vocamera/data_classes/word/word.dart';
import 'package:vocamera/notifilers/user_notifier.dart';

class WordsViewModel extends ChangeNotifier {
  WordsViewModel({this.locator}) {
    initialize();
  }

  void initialize() async {
    await locator<UserNotifier>().fetchWords();
    words = locator<UserNotifier>().words;
    isLoading = false;
    notifyListeners();
  }

  final Locator locator;
  bool isLoading = true;

  /// dismiss 時に words 内からも単語を除き rebuild をかけたいため view model で管理
  List<Word> words = [];

  Future<void> deleteWord(
    GlobalKey<ScaffoldState> scaffoldKey,
    Word word,
  ) async {
    await locator<UserNotifier>().deleteWord(word.id);
    await locator<UserNotifier>().fetchWords();
    words = locator<UserNotifier>().words;
    notifyListeners();
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("削除しました")));
  }
}
