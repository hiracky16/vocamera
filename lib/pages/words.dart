import 'package:flutter/material.dart';
import 'package:vocamera/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/models/user.dart';

class Words extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('単語一覧'),
      ),
      drawer: buildDrawer(context),
      body: Consumer<User>(builder: (context, user, _) {
        return Container(
          child: Text('hello ${user.user.displayName}')
        );
      })
    );
  }
}