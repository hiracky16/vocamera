// TODO: freezed の fromJson を使うといい感じになるかも
import 'package:cloud_firestore/cloud_firestore.dart';

const CANT_TRANSLATE_MESSAGE = '翻訳できませんでした';

class Word {
  String id;
  String userId;
  Translated translated;
  String word;

  Word(String id, DocumentSnapshot word) {
    this.id = id;
    this.word = word.data['word'];
    if (word.data.containsKey('translated')) {
      final translated = word.data['translated'];
      this.translated =
          Translated(translated['ja'], translated['en'], translated['zh']);
    } else {
      this.translated = Translated(CANT_TRANSLATE_MESSAGE,
          CANT_TRANSLATE_MESSAGE, CANT_TRANSLATE_MESSAGE);
    }
  }
}

class Translated {
  String ja;
  String en;
  String zh;

  Translated(String ja, String en, String zh) {
    this.ja = ja;
    this.en = en;
    this.zh = zh;
  }
}
