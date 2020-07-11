import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreApi {
  static final Firestore _fireStore = Firestore.instance;

  static Stream<QuerySnapshot> getWords(String userId) {
    return _fireStore
      .collection('users')
      .document(userId)
      .collection('words')
      .snapshots();
  }

  static void postWord(String userId, String word) async {
    DateTime now = new DateTime.now();
    await _fireStore
      .collection('users')
      .document(userId)
      .collection('words')
      .document()
      .setData({'word': word, 'user_id': userId, 'timestamp': now });
  }
}