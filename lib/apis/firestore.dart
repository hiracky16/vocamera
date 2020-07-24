import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocamera/data_classes/word/word.dart';

class FirestoreApi {
  static final Firestore _fireStore = Firestore.instance;

  static Future<List<Word>> fetchWords(String userId) async {
    final res = await _fireStore
      .collection('users')
      .document(userId)
      .collection('words')
      .getDocuments();
    List<Word> words = [];
    res.documents.forEach((element) => {
      words.add(Word(element.documentID, element))
    });
    return words;
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

  static void deleteWord(String userId, String id) async {
    await _fireStore
      .collection('users')
      .document(userId)
      .collection('words')
      .document(id)
      .delete();
  }
}