import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:vocamera/widgets/button.dart';
import 'package:vocamera/widgets/drawer.dart';

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("カメラで単語登録"),
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _startCamera(context),
          ],
        ),
      ),
    );
  }

  Widget _startCamera(context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: button("カメラを開く\n注: 英語限定", () { _onPickImageSelected(context); })
          ),
        ],
      ),
    );
  }

  void _onPickImageSelected(context) async {
    final _picker = ImagePicker();
    var imageSource = ImageSource.camera;

    try {
      PickedFile file = await _picker.getImage(source: imageSource);
      if (file == null) {
        throw Exception('ファイルを取得できませんでした');
      }
    } catch(e) {
      Navigator.of(context).pushNamed("/list");
    }
  }

}