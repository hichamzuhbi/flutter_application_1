import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/logIn_Pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Authify",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimatedLoginPage(),
    );
  }
}
