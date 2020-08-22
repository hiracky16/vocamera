import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:vocamera/data_classes/word/visionWord.dart';
import 'package:vocamera/notifilers/user_notifier.dart';
import 'package:vocamera/widgets/button.dart';
import 'package:vocamera/widgets/drawer.dart';

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("カメラで単語登録"),
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _startCamera(context),
          ],
        ),
      ),
    );
  }

  Widget _startCamera(context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: button("カメラを開く\n注: 英語限定", () {
            _onPickImageSelected(context);
          })),
        ],
      ),
    );
  }

  void _onPickImageSelected(context) async {
    final _picker = ImagePicker();
    var imageSource = ImageSource.camera;

    try {
      PickedFile file = await _picker.getImage(source: imageSource);
      if (file == null) {
        throw Exception('ファイルを取得できませんでした');
      }
      List<VisionWord> words =
          await Provider.of<UserNotifier>(context, listen: false).detectText(file.path);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddWords(words)));
    } catch (e) {
      Navigator.of(context).pushNamed("/list");
    }
  }
}

class AddWords extends StatefulWidget {
  AddWords(this.words);
  final List<VisionWord> words;
  @override
  _AddWordsState createState() => new _AddWordsState();
}

class _AddWordsState extends State<AddWords> {
  List<VisionWord> words;

  @override
  void initState() {
    this.words = widget.words;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("カメラで単語登録"),
        ),
        drawer: buildDrawer(context),
        body: Column(
          children: <Widget>[
            _buildTextList(words),
            Padding(
              child: new MaterialButton(
                key: null,
                onPressed: _registWords,
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                elevation: 5.0,
                minWidth: 200.0,
                height: 60.0,
                child: new Text(
                  "登録",
                  style: new TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                ),
              ),
              padding: const EdgeInsets.all(24.0),
            ),
          ],
        ));
  }

  Widget _buildTextList(List<VisionWord> texts) {
    if (texts.length == 0) {
      return Expanded(
          flex: 1,
          child: Center(
            child: Text('読み取れる文字がありませんでした。',
              style: Theme.of(context).textTheme.caption),
          ));
    }

    return Expanded(
      flex: 1,
      child: Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: texts.length,
            itemBuilder: (context, i) {
              return _buildTextRow(texts[i], i);
            }),
      ),
    );
  }

  Widget _buildTextRow(VisionWord text, int index) {
    var word = text.text != null ? text.text : '';
    return CheckboxListTile(
      activeColor: Colors.blue,
      controlAffinity: ListTileControlAffinity.leading,
      value: text.check,
      onChanged: (bool value) {
        _handleCheckbox(value, index);
      },
      title: Text(
        "$word",
      ),
      dense: true,
    );
  }

  void _handleCheckbox(bool value, int index) {
    words[index].check = !words[index].check;
    setState(() {
      words = words;
    });
  }

  void _registWords() {
    // TODO: 一括書き込みにしたい
    words.forEach((w) {
      if (w.check) {
        context.watch<UserNotifier>().addWordByParamWord(w.text);
      }
    });
    Navigator.of(context).pushNamed("/list");
  }

}
