import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vocamera/widgets/drawer.dart';
import 'package:vocamera/widgets/logo.dart';
import 'package:vocamera/helpers/googleSignIn.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/models/user.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('ログイン'),
      ),
      drawer: buildDrawer(context),
      body: Consumer<User>(builder: (context, user, _) {
        return Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logo(320),
                SizedBox(height: 50),
                _signInButton(context, (FirebaseUser firebaseUser) => {
                  user.setUser(firebaseUser)
                }),
              ],
            ),
          )
        );
      })
    );
  }

  Widget _signInButton(BuildContext context, Function callback) {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async {
        FirebaseUser user = await signInWithGoogle();
        callback(user);
        Navigator.pushNamed(context, "/list");
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/images/google-logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}