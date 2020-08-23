import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocamera/data_classes/word/visionWord.dart';
import 'package:vocamera/viewmodels/add_words_from_camera_viewmodel.dart';
import 'package:vocamera/widgets/button.dart';
import 'package:vocamera/widgets/drawer.dart';
import 'package:vocamera/widgets/loading.dart';

class AddWordsFromCameraArgument {
  AddWordsFromCameraArgument({this.words});
  final List<VisionWord> words;
}

class AddWordsFromCamera extends StatelessWidget {
  const AddWordsFromCamera._({Key key}) : super(key: key);

  static Widget withArguments() {
    return Builder(builder: (context) {
      final arg = ModalRoute.of(context).settings.arguments
          as AddWordsFromCameraArgument;
      return ChangeNotifierProvider(
          create: (context) => AddWordsFromCameraViewModel(
                locator: context.read,
                words: arg.words,
              ),
          child: AddWordsFromCamera._());
    });
  }

  @override
  Widget build(BuildContext context) {
    final words = context.watch<AddWordsFromCameraViewModel>().words;
    final isLoading = context
        .select((AddWordsFromCameraViewModel viewModel) => viewModel.isLoading);
    return Scaffold(
        appBar: AppBar(
          title: Text("カメラで単語登録"),
        ),
        drawer: buildDrawer(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTextList(context, words),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: button(
                '登録',
                () =>
                    context.read<AddWordsFromCameraViewModel>().registerWords(),
              ),
            ),
            Loading(visible: isLoading)
          ],
        ));
  }

  Widget _buildTextList(BuildContext context, List<VisionWord> texts) {
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
              return _buildTextRow(context, texts[i]);
            }),
      ),
    );
  }

  Widget _buildTextRow(BuildContext context, VisionWord text) {
    var word = text.text != null ? text.text : '';
    return CheckboxListTile(
      activeColor: Colors.blue,
      controlAffinity: ListTileControlAffinity.leading,
      value: text.check,
      onChanged: (value) => context
          .read<AddWordsFromCameraViewModel>()
          .updateWordCheckStatus(text, value),
      title: Text(
        "$word",
      ),
      dense: true,
    );
  }
}
