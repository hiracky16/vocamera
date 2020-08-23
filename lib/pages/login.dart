import 'package:flutter/material.dart';
import 'package:vocamera/viewmodels/login_viewmodel.dart';
import 'package:vocamera/widgets/drawer.dart';
import 'package:vocamera/widgets/logo.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => LoginViewModel(locator: context.read))
      ],
      child: const Login._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// 初期化を走らせるために
    context.watch<LoginViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
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
              _signInButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async {
        await context.read<LoginViewModel>().login();
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
            Image(
                image: AssetImage("assets/images/google-logo.png"),
                height: 35.0),
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
