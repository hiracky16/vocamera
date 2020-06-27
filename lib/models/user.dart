import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  FirebaseUser _user;

  void setUser(FirebaseUser user) {
    this._user = user;
  }

  FirebaseUser get user => this._user;
}
