import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/data_classes/user/user.dart';
import 'package:vocamera/notifilers/user_notifier.dart';
import 'package:vocamera/pages/add_word.dart';
import 'package:vocamera/pages/add_words_from_camera.dart';
import 'package:vocamera/pages/login.dart';
import 'package:vocamera/pages/words.dart';
import 'package:vocamera/repositories/analytics.dart';
import 'package:vocamera/repositories/firebase_auth.dart';
import 'package:vocamera/repositories/firestore.dart';
import 'package:vocamera/pages/camera.dart';
import 'package:vocamera/repositories/mlkit.dart';
import 'apis/analytics.dart';

void main() {
  final navigatorKey = GlobalKey<NavigatorState>();
  // enableFlutterDriverExtension();
  runApp(MyApp(
    navigatorKey: navigatorKey,
  ));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mainProvider(navigatorKey);
  }
}

MultiProvider mainProvider(GlobalKey<NavigatorState> navigatorKey) {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  return MultiProvider(
    providers: [
      Provider(create: (_) => FirebaseAuthRepository()),
      Provider(create: (_) => FirestoreRepository()),
      Provider(create: (_) => MlkitRepository()),
      Provider(create: (_) => AnalyticsRepository(analytics: analytics)),
      Provider.value(value: navigatorKey),
    ],
    child: StateNotifierProvider<UserNotifier, User>(
      create: (context) => UserNotifier(),
      child: _MainView(
        navigatorKey: navigatorKey,
        analytics: analytics,
      ),
    ),
  );
}

class _MainView extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final FirebaseAnalytics analytics;
  const _MainView({Key key, this.navigatorKey, this.analytics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vocamera',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      navigatorKey: navigatorKey,
      home: Login.wrapped(),
      routes: <String, WidgetBuilder>{
        '/login': (_) => Login.wrapped(),
        '/list': (_) => Words.wrapped(),
        '/add': (_) => AddWord.wrapped(),
        '/camera': (_) => Camera.wrapped(),
        '/add_words_from_camera': (_) => AddWordsFromCamera.withArguments()
      },
    );
  }
}
