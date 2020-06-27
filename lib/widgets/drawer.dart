import 'package:flutter/material.dart';
import 'package:vocamera/helpers/googleSignIn.dart';

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Text(
            'Vocamera',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
        ),
        ListTile(
          title: Text('単語リスト'),
          onTap: () {
            Navigator.pushNamed(context, '/list');
          },
        ),
        // ListTile(
        //   title: Text('カメラで登録'),
        //   onTap: () {
        //     Navigator.pushNamed(context, '/camera');
        //   },
        // ),
        // ListTile(
        //   title: Text('単語登録'),
        //   onTap: () {
        //     Navigator.pushNamed(context, '/register');
        //   },
        // ),
        // ListTile(
        //   title: Text('クイズ'),
        //   onTap: () {
        //     Navigator.pushNamed(context, '/quiz');
        //   },
        // ),
        ListTile(
          title: Text('ログアウト'),
          onTap: () async {
            await signOutGoogle();
            Navigator.pushNamed(context, '/login');
          },
        ),
      ],
    ),
  );
}
