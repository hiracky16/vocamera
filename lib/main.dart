import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/pages/login.dart';
import 'package:vocamera/pages/words.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.yellow,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Login(),
            routes: <String, WidgetBuilder>{
              '/login': (_) => new Login(),
              '/list': (_) => new Words()
            },
          );
  }
}
