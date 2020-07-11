import 'package:vocamera/apis/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocamera/data_classes/word/word.dart';

class FirestoreRepository {
  Future<List<Word>> fetchWords(userId) async {
    List<Word> response = await FirestoreApi.fetchWords(userId);
    return response;
  }

  postWord(String userId, String word) {
    FirestoreApi.postWord(userId, word);
  }

  deleteWord(String userId, String id) {
    FirestoreApi.deleteWord(userId, id);
  }
}
