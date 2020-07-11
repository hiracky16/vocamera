import 'dart:io';

import 'package:vocamera/apis/mlkit.dart';
import 'package:vocamera/data_classes/word/visionWord.dart';

class MlkitRepository {
  Future<List<VisionWord>> detectText(String filePath) async {
    return await MlkitApi.detectText(filePath);
  }
}
