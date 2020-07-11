import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/data_classes/user/user.dart';
import 'package:vocamera/notifilers/user_notifier.dart';
import 'package:vocamera/pages/add_word.dart';
import 'package:vocamera/pages/login.dart';
import 'package:vocamera/pages/words.dart';
import 'package:vocamera/repositories/firebase_auth.dart';
import 'package:vocamera/repositories/firestore.dart';
import 'package:vocamera/pages/camera.dart';
import 'package:vocamera/repositories/mlkit.dart';

void main() {
  // enableFlutterDriverExtension();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return mainProvider();
  }
}

MultiProvider mainProvider() {
  return MultiProvider(
    providers: [
      Provider(create: (_) => FirebaseAuthRepository()),
      Provider(create: (_) => FirestoreRepository()),
      Provider(create: (_) => MlkitRepository()),
    ],
    child: StateNotifierProvider<UserNotifier, User>(
      create: (context) => UserNotifier(),
      child: _MainView()
    ),
  );
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
        '/add': (_) => new AddWord(),
        '/camera': (_) => new Camera()
      },
    );
  }
}
