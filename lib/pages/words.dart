import 'package:flutter/material.dart';
import 'package:vocamera/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


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
        body: Consumer<User>(builder: (context, user, _) {
          return Container(
              child: StreamBuilder<QuerySnapshot>(
                  stream: user.getWords(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Loading...');
                      default:
                        return new ListView(
                          children: snapshot.data.documents
                              .map((DocumentSnapshot document) {
                            var id = document.documentID;
                            var data = document.data;
                            var format = new DateFormat('yyyy/MM/dd');
                            var dateString = format.format(data['timestamp']?.toDate());
                            if (!data.containsKey('translated')) {
                              data['translated'] = {
                                'ja': '',
                                'en': '',
                                'zh': ''
                              };
                            }
                            return new Card(
                                color: Colors.white,
                                elevation: 0.0,
                                child: Dismissible(
                                    key: Key(id),
                                    background: Container(
                                        color: Colors.red), // start to endの背景
                                    secondaryBackground: Container(
                                        color: Colors.red), // end to startの背景
                                    onDismissed: (direction) {
                                      user.deleteWord(id);
                                      showDialog(context);
                                    },
                                    child: ExpansionTile(
                                        title: Text(data['word']),
                                        subtitle: Text('登録日: $dateString'),
                                        children: <Widget>[
                                          new ListTile(
                                              title: Text('日本語: ' +
                                                  data['translated']['ja'])),
                                          new ListTile(
                                              title: Text('英語: ' +
                                                  data['translated']['en'])),
                                          new ListTile(
                                              title: Text('中国語: ' +
                                                  data['translated']['zh'])),
                                        ])));
                          }).toList(),
                        );
                    }
                  }));
        }));
  }
}
