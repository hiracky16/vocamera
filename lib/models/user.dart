import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User extends ChangeNotifier {
  final Firestore _fireStore = Firestore.instance;

  FirebaseUser _user;
  String _addWord;

  void setUser(FirebaseUser user) {
    this._user = user;
  }

  void setAddWord(String word) {
    this._addWord = word;
  }

  FirebaseUser get user => this._user;
  String get addWord => this._addWord;

  void postAddWord() async {
    String userId = this.user.uid;
    DateTime now = new DateTime.now();
    await _fireStore
      .collection('users')
      .document(userId)
      .collection('words')
      .document()
      .setData({'word': this.addWord, 'user_id': userId, 'timestamp': now });
    setAddWord('');
  }
}
