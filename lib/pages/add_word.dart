import 'package:flutter/material.dart';
import 'package:vocamera/viewmodels/add_word_viewmodel.dart';
import 'package:vocamera/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/widgets/button.dart';

var wordController = TextEditingController();

class AddWord extends StatelessWidget {
  const AddWord._({Key key}) : super(key: key);

  static Widget wrapped() {
    return ChangeNotifierProvider(
      create: (context) => AddWordViewModel(locator: context.read),
      child: AddWord._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = context.watch<AddWordViewModel>().isEnabled;
    final word = context.watch<AddWordViewModel>().word;
    return Scaffold(
        appBar: AppBar(
          title: Text('単語登録'),
        ),
        drawer: buildDrawer(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                initialValue: word,
                decoration: InputDecoration(
                  labelText: '登録する単語を入力',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) =>
                    context.read<AddWordViewModel>().updateWord(value),
                style: TextStyle(
                    fontSize: 24.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: button(
                '登録',
                () {
                  isEnabled
                      ? context.read<AddWordViewModel>().registerWord()
                      : null;
                },
              ),
            )
          ],
        ));
  }
}
