import 'package:flutter/material.dart';
import 'package:vocamera/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/models/user.dart';
import 'package:vocamera/widgets/button.dart';

var wordController = TextEditingController();

class AddWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool validate(String word) {
      return word != null && word.length > 0;
    }

    void register(User user) async {
      await user.postAddWord();
      wordController.text = '';
      Navigator.pushNamed(context, "/list");
    }

    return Scaffold(
        appBar: new AppBar(
          title: new Text('単語登録'),
        ),
        drawer: buildDrawer(context),
        body: Consumer<User>(builder: (context, user, _) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: new TextField(
                      decoration: InputDecoration(
                          labelText: '登録する単語を入力', border: OutlineInputBorder()),
                      controller: wordController,
                      onChanged: (value) => user.setAddWord(value.trim()),
                      style: new TextStyle(
                          fontSize: 24.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                    )),
                Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: button('登録', () {
                      var flag = validate(user.addWord);
                      flag ? register(user) : print('空');
                    }))
              ]);
        }));
  }
}
