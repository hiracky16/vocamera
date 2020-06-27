import 'package:flutter/material.dart';
import 'package:vocamera/widgets/drawer.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: new Text('Vocamera'),
        ),
        drawer: buildDrawer(context),
        body: new Container(
          child: new Text('test')
        )
    );
  }
}