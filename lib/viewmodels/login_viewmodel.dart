import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:vocamera/notifilers/user_notifier.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({this.locator}) {
    checkLogin();
  }

  final Locator locator;

  void checkLogin() async {
    await locator<UserNotifier>().checkLogin();
    final isLogined = locator<UserNotifier>().isLogined;
    if (isLogined) {
      locator<GlobalKey<NavigatorState>>().currentState.pushNamed('/list');
    }
  }

  Future login() async {
    await locator<UserNotifier>().signIn();
    locator<GlobalKey<NavigatorState>>().currentState.pushNamed('/list');
  }
}
