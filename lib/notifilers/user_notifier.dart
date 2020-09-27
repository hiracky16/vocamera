import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:vocamera/data_classes/user/user.dart';
import 'package:vocamera/data_classes/word/word.dart';
import 'package:vocamera/repositories/analytics.dart';
import 'package:vocamera/repositories/firebase_auth.dart';
import 'package:vocamera/repositories/firestore.dart';
import 'package:vocamera/repositories/mlkit.dart';

class UserNotifier extends StateNotifier<User> with LocatorMixin {
  UserNotifier() : super(User(firebaseUser: null));
  FirebaseAuthRepository get authRepository => read<FirebaseAuthRepository>();
  FirestoreRepository get storeRepository => read<FirestoreRepository>();
  MlkitRepository get mlkitRepository => read<MlkitRepository>();
  AnalyticsRepository get analyticsRepository => read<AnalyticsRepository>();

  List<Word> get words => state.words;
  String get _userId => state.firebaseUser.uid;
  bool get isLogined => state.firebaseUser?.uid != null;

  signIn() async {
    final user = await authRepository.signIn();
    await analyticsRepository.setUser(user);
    state = state.copyWith(firebaseUser: user);
  }

  Future checkLogin() async {
    final user = await authRepository.checkLogined();
    await analyticsRepository.setUser(user);
    state = state.copyWith(firebaseUser: user);
  }

  signOut() {
    authRepository.signOut();
    state = state.copyWith(firebaseUser: null);
  }

  addWord(String word) async {
    await storeRepository.postWord(_userId, word);
    await analyticsRepository.outputLogEvent(
      AnalyticsEventType.add_word,
      {'word': word},
    );
  }

  fetchWords() async {
    List<Word> words = await storeRepository.fetchWords(_userId);
    state = state.copyWith(words: words);
  }

  deleteWord(String id) async {
    await storeRepository.deleteWord(_userId, id);
  }

  detectText(String filePath) async {
    return await mlkitRepository.detectText(filePath);
  }
}
