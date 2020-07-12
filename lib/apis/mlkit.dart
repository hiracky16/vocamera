import 'dart:io';

import 'package:mlkit/mlkit.dart';
import 'package:vocamera/data_classes/word/visionWord.dart';

class MlkitApi {
  static final detector = FirebaseVisionTextDetector.instance;

  static Future<dynamic> detectText(String filePath) async {
    List<VisionText> words = await detector.detectFromPath(filePath);
    List<VisionWord> visionWords = [];
    words.forEach((v) {
      if (v.text != null && v.text.isNotEmpty) {
        visionWords.add(VisionWord(v.text));
      }
    });
    return visionWords;
  }
}
