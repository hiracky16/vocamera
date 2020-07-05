import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/data_classes/user/user.dart';
import 'package:vocamera/pages/add_word.dart';
import 'package:vocamera/pages/login.dart';
import 'package:vocamera/pages/words.dart';
import 'package:vocamera/repositories/firebase_auth.dart';
import 'package:vocamera/view_models/login_view_model.dart';

void main() {
  // enableFlutterDriverExtension();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            Provider(create: (_) => FirebaseAuthRepository()),
          ],
          child: StateNotifierProvider<LoginViewModel, User>(
            create: (context) => LoginViewModel(),
            child: _MainView(),
          ),
    );
  }
}

class _MainView extends StatelessWidget {
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
        '/list': (_) => new Words(),
        '/add': (_) => new AddWord()
      },
    );
  }
}
