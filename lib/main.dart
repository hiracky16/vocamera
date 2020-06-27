import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/models/user.dart';
import 'package:vocamera/pages/login.dart';
import 'package:vocamera/pages/words.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            ChangeNotifierProvider<User>(
              create: (_) => User(),
            ),
          ],
          child: MaterialApp(
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
          )
        );
  }
}
