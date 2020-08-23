import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:vocamera/data_classes/word/visionWord.dart';
import 'package:vocamera/notifilers/user_notifier.dart';

class AddWordsFromCameraViewModel extends ChangeNotifier {
  AddWordsFromCameraViewModel({this.locator, this.words});

  List<VisionWord> words;
  final Locator locator;
  bool isLoading = false;

  void updateWordCheckStatus(VisionWord word, bool value) {
    words = words.map((e) {
      if (word.text == e.text) {
        e.check = value;
      }
      return e;
    }).toList();
    notifyListeners();
  }

  void registerWords() async {
    isLoading = true;
    notifyListeners();
    words.forEach((w) async {
      if (w.check) {
        await _addWord(w.text);
      }
    });
    isLoading = false;
    notifyListeners();
    locator<GlobalKey<NavigatorState>>().currentState.pushNamed("/list");
  }

  Future<void> _addWord(String word) async {
    await locator<UserNotifier>().addWord(word);
  }
}
