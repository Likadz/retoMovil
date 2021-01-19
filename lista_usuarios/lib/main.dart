import 'package:flutter/material.dart';
import 'package:lista_usuarios/user-list.dart';

import 'pages/candidatos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ranking',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: UserList(),
    );
  }
}