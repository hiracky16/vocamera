import 'package:flutter/material.dart';
import 'package:vocamera/widgets/drawer.dart';

class Words extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('単語一覧'),
      ),
      drawer: buildDrawer(context),
      body: Container(
        child: Text('words')
      )
    );
  }
}