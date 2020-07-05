import 'package:flutter/material.dart';
import 'package:vocamera/widgets/drawer.dart';

class Words extends StatelessWidget {
  Widget build(BuildContext context) {
    void showDialog(BuildContext context) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("削除しました")));
    }

    return Scaffold(
        appBar: new AppBar(
          title: new Text('単語リスト'),
        ),
        drawer: buildDrawer(context),
        body: Container(
          child: Text('単語リスト')
        )
    );
  }
}
