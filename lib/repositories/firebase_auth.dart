import 'package:firebase_auth/firebase_auth.dart';
import 'package:vocamera/apis/firebase_auth.dart';

class FirebaseAuthRepository {
  Future<FirebaseUser> signIn() async {
    return await FirebaseAuthApi.signInWithGoogle();
  }

  void signOut() {
    FirebaseAuthApi.signOutGoogle();
  }
}