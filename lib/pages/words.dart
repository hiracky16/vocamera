import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/data_classes/word/word.dart';
import 'package:vocamera/notifilers/user_notifier.dart';
import 'package:vocamera/widgets/drawer.dart';

class Words extends StatelessWidget {
  Widget build(BuildContext context) {
    context.watch<UserNotifier>().fetchWords();
    List<Word> words = context.watch<UserNotifier>().words;

    bool isExistWords() {
      return words != null && words.length > 0;
    }

    return Scaffold(
        appBar: new AppBar(
          title: new Text('単語リスト'),
        ),
        drawer: buildDrawer(context),
        body: Builder(
          builder: (context) => Container(
            child: isExistWords()
                ? ListView(
                    children: words.map((Word w) {
                      return new Card(
                          color: Colors.white,
                          elevation: 0.0,
                          child: Dismissible(
                              key: Key(w.id),
                              background: Container(
                                  color: Colors.red), // start to endの背景
                              secondaryBackground: Container(
                                  color: Colors.red), // end to startの背景
                              onDismissed: (direction) {
                                context.watch<UserNotifier>().deleteWord(w.id);
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text("削除しました")));
                              },
                              child: ExpansionTile(
                                  title: Text(w.word),
                                  children: <Widget>[
                                    ListTile(title: Text('日本語: ${w.translated.ja}')),
                                    ListTile(title: Text('英語: ${w.translated.en}')),
                                    ListTile(title: Text('中国語: ${w.translated.zh}')),
                                  ])));
                    }).toList(),
                  )
                : Text('読込中'))));
  }
}
