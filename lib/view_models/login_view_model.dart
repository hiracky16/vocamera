import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/data_classes/user/user.dart';
import 'package:vocamera/repositories/firebase_auth.dart';

class LoginViewModel extends StateNotifier<User> with LocatorMixin {
  LoginViewModel(): super(User(firebaseUser: null));
  FirebaseAuthRepository get repository => read<FirebaseAuthRepository>();

  signIn() async {
    final user = await repository.signIn();
    state = state.copyWith(firebaseUser: user);
  }

  signOut() {
    repository.signOut();
    state = state.copyWith(firebaseUser: null);
  }
}
