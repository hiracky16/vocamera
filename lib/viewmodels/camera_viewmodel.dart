import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:vocamera/data_classes/word/visionWord.dart';
import 'package:vocamera/notifilers/user_notifier.dart';
import 'package:vocamera/pages/add_words_from_camera.dart';

class CameraViewModel extends ChangeNotifier {
  CameraViewModel({this.locator});

  final Locator locator;
  bool isLoading = false;

  void onPickImageSelected() async {
    final _picker = ImagePicker();
    var imageSource = ImageSource.camera;
    isLoading = true;
    notifyListeners();
    try {
      final file = await _picker.getImage(source: imageSource);
      if (file == null) {
        throw Exception('ファイルを取得できませんでした');
      }
      List<VisionWord> words =
          await locator<UserNotifier>().detectText(file.path);
      locator<GlobalKey<NavigatorState>>().currentState.pushNamed(
          '/add_words_from_camera',
          arguments: AddWordsFromCameraArgument(words: words));
    } catch (e) {
      locator<GlobalKey<NavigatorState>>().currentState.pushNamed("/list");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
