import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:vocamera/notifilers/user_notifier.dart';

class AddWordViewModel extends ChangeNotifier {
  AddWordViewModel({this.locator});

  final Locator locator;
  String word = '';
  bool get isEnabled => word.length > 0;

  void registerWord() async {
    await locator<UserNotifier>().addWordByParamWord(word);
    word = '';
    locator<GlobalKey<NavigatorState>>().currentState.pushNamed('/list');
  }

  void updateWord(String value) {
    word = value;
    notifyListeners();
  }
}
