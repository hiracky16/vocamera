import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  Loading({@required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return visible
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container();
  }
}
