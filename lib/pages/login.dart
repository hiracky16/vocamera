import 'package:flutter/material.dart';
import 'package:vocamera/view_models/login_view_model.dart';
import 'package:vocamera/widgets/drawer.dart';
import 'package:vocamera/widgets/logo.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('ログイン'),
      ),
      drawer: buildDrawer(context),
      body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logo(320),
                SizedBox(height: 50),
                _signInButton(context, () {
                  Navigator.pushNamed(context, "/list");
                }),
              ],
            ),
          )
        )
    );
  }

  Widget _signInButton(BuildContext context, Function callback) {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async {
        await Provider.of<LoginViewModel>(context, listen: false).signIn();
        callback();
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