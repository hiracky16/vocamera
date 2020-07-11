import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/data_classes/user/user.dart';
import 'package:vocamera/data_classes/word/word.dart';
import 'package:vocamera/repositories/firebase_auth.dart';
import 'package:vocamera/repositories/firestore.dart';

class UserNotifier extends StateNotifier<User> with LocatorMixin {
  UserNotifier(): super(User(firebaseUser: null));
  FirebaseAuthRepository get authRepository => read<FirebaseAuthRepository>();
  FirestoreRepository get storeRepository => read<FirestoreRepository>();

  String get word => state.word;
  List<Word> get words => state.words;
  String get _userId => state.firebaseUser.uid;

  signIn() async {
    final user = await authRepository.signIn();
    state = state.copyWith(firebaseUser: user);
    print(state);
  }

  signOut() {
    authRepository.signOut();
    state = state.copyWith(firebaseUser: null);
  }

  inputWord(String value) {
    print(state);
    state = state.copyWith(word: value);
    print(state);
  }

  addWord() async {
    await storeRepository.postWord(_userId, state.word);
  }

  fetchWords() async {
    List<Word> words = await storeRepository.fetchWords(_userId);
    state = state.copyWith(words: words);
  }

  deleteWord(String id) async {
    await storeRepository.deleteWord(_userId, id);
  }
}
