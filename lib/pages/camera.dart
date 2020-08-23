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
    return Scaffold(
      appBar: AppBar(
        title: Text("カメラ"),
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 32),
              Text(
                '※ カメラで撮った単語を登録することができます。\n注: 英語限定',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                    fontFamily: "Roboto"),
              ),
              const SizedBox(height: 16),
              button(
                "カメラを開く",
                () => context.read<CameraViewModel>().onPickImageSelected(),
              ),
              const SizedBox(height: 16),
              Loading(visible: isLoading),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}
