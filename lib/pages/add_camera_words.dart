import 'dart:async';
import 'dart:io';
import 'package:vocamera/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:mlkit/mlkit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddCameraWords extends StatefulWidget {
  AddCameraWords(this._file);

  final File _file;

  @override
  _DetailWidgetState createState() => new _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  FirebaseVisionTextDetector _detector = FirebaseVisionTextDetector.instance;
  List<ExtendVisionText> _currentTextLabels = <ExtendVisionText>[];
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _fireStore = Firestore.instance;

  @override
  void initState() {
    super.initState();

    Timer(Duration(microseconds: 1000), () {
      this._analyzeLabels();
    });
  }

  _analyzeLabels() async {
    try {
      var currentTextLabels = await _detector.detectFromPath(widget._file.path);
      List<String> stringTexts = split2Words(currentTextLabels);
      List<ExtendVisionText> tmpList = <ExtendVisionText>[];
      stringTexts.forEach((String text) {
        var e = ExtendVisionText(text);
        tmpList.add(e);
      });
      setState(() {
        _currentTextLabels = tmpList;
      });
    } catch (e) {
      print(e.toString());
    }
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
            _buildTextList(_currentTextLabels),
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

  Widget _buildTextList(List<ExtendVisionText> texts) {
    if (texts.length == 0) {
      return Expanded(
          flex: 1,
          child: Center(
            child: Text('読み取れる文字がありませんでした。',
                style: Theme.of(context).textTheme.subhead),
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

  Widget _buildTextRow(ExtendVisionText text, int index) {
    var word = text._visionText != null ? text._visionText : '';
    return CheckboxListTile(
      activeColor: Colors.blue,
      controlAffinity: ListTileControlAffinity.leading,
      value: text._check,
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
    _currentTextLabels[index]._check = !_currentTextLabels[index]._check;
    setState(() {
      _currentTextLabels = _currentTextLabels;
    });
    print(_currentTextLabels[index]._check);
  }

  void _registWords() {
    _currentTextLabels.forEach((ExtendVisionText text) {
      if(text._check) {
        registStore(text._visionText);
      }
    });
    Navigator.of(context).pushNamed("/list");
  }

  void registStore(String _word) async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    var now = new DateTime.now();
    print(_word);
    try {
      await _fireStore
        .collection('users')
        .document(user.uid)
        .collection('words')
        .document()
        .setData({'word': _word, 'user_id': user.uid, 'timestamp': now});
    } catch (e) {
      print(e.toString());
    }
  }
}

List<String> split2Words(List<VisionText> visionTexts) {
  // 空白以外の文字を filter して visionText からテキストだけ取り出す
  List<String> texts = <String>[];
  visionTexts.forEach((VisionText vt) {
    if(vt != null && vt.text.isNotEmpty) {
      texts.add(vt.text);
    }
  });
  // 空白文字でつなげる
  String joinedText = texts.join(" ");
  String nonlText = joinedText.replaceAll("\n", " ");

  return nonlText.split(" ");
}

class ExtendVisionText {
  String _visionText;
  bool _check;

  ExtendVisionText(String v) {
    _visionText = v;
    _check = false;
  }
}