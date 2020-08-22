import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:vocamera/notifilers/user_notifier.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({this.locator});

  final Locator locator;

  Future login() async {
    await locator<UserNotifier>().signIn();
    locator<GlobalKey<NavigatorState>>().currentState.pushNamed('/list');
  }
}
