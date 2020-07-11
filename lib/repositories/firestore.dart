import 'package:vocamera/apis/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  Future<dynamic> fetchWords(userId) async {
    Stream<QuerySnapshot> response = FirestoreApi.getWords(userId);
    return response;
  }

  postWord(String userId, String word) {
    FirestoreApi.postWord(userId, word);
  }
}
