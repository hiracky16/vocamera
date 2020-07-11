import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:vocamera/data_classes/word/word.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    FirebaseUser firebaseUser,
    String word,
    List<Word> words
  }) = _User;
}