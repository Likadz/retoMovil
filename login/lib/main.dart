import 'package:flutter/material.dart';
import 'package:login/widget/loginScreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      //home: PruebasApi(),
      home: LoginScreen(),
      //home: RegisterScreen(),
    );
  }
}