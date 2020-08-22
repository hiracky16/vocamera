import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:vocamera/viewmodels/camera_viewmodel.dart';
import 'package:vocamera/widgets/button.dart';
import 'package:vocamera/widgets/drawer.dart';
import 'package:vocamera/widgets/loading.dart';

class Camera extends StatelessWidget {
  const Camera._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => CameraViewModel(locator: context.read)),
      ],
      child: Camera._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<CameraViewModel>().isLoading;
    return new Scaffold(
      appBar: AppBar(
        title: Text("カメラで単語登録"),
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 32),
            _startCamera(context),
            Loading(visible: isLoading)
          ],
        ),
      ),
    );
  }

  Widget _startCamera(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: button("カメラを開く\n注: 英語限定",
          () => context.read<CameraViewModel>().onPickImageSelected()),
    );
  }
}
