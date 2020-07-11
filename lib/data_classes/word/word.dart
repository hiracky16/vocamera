
// TODO: freezed の fromJson を使うといい感じになるかも
class Word {
  String id;
  String userId;
  Translated translated;
  String word;

  Word(String id, String word) {
    this.id = id;
    this.word = word;
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