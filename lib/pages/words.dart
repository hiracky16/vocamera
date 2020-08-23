import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/data_classes/word/word.dart';
import 'package:vocamera/notifilers/user_notifier.dart';
import 'package:vocamera/viewmodels/words_viewmodel.dart';
import 'package:vocamera/widgets/drawer.dart';

class Words extends StatelessWidget {
  Words._({Key key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => WordsViewModel(locator: context.read))
      ],
      child: Words._(),
    );
  }

  Widget build(BuildContext context) {
    final words = context.watch<WordsViewModel>().words;
    final isLoading = context.watch<WordsViewModel>().isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text('単語リスト'),
      ),
      key: _scaffoldKey,
      drawer: buildDrawer(context),
      body: Builder(
        builder: (context) => Container(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children:
                      words.map((Word w) => wordCard(context, w)).toList(),
                ),
        ),
      ),
    );
  }

  Widget wordCard(BuildContext context, Word word) {
    return Card(
      color: Colors.white,
      elevation: 0.0,
      child: Dismissible(
        key: ObjectKey(word.id),
        background: Container(color: Colors.red),
        secondaryBackground: Container(color: Colors.red),
        onDismissed: (_) =>
            context.read<WordsViewModel>().deleteWord(_scaffoldKey, word),
        child: ExpansionTile(
          title: Text(word.word),
          children: <Widget>[
            ListTile(title: Text('日本語: ${word.translated.ja}')),
            ListTile(title: Text('英語: ${word.translated.en}')),
            ListTile(title: Text('中国語: ${word.translated.zh}')),
          ],
        ),
      ),
    );
  }
}
