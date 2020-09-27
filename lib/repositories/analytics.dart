import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AnalyticsEventType {
  add_word,
}

class AnalyticsRepository {
  AnalyticsRepository({this.analytics});
  final FirebaseAnalytics analytics;

  Future setUser(FirebaseUser user) async {
    await analytics.setUserId(user.uid);
  }

  Future outputLogEvent(
      AnalyticsEventType type, Map<String, dynamic> params) async {
    String event = _enumToString(type);
    await analytics.logEvent(
      name: event,
      parameters: params,
    );
  }

  String _enumToString(AnalyticsEventType eventType) {
    return eventType.toString().split('.')[1];
  }
}
