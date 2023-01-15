import 'package:demo_app/First_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Demo_App());
}

class Demo_App extends StatelessWidget {
  const Demo_App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      theme: ThemeData(),
      home: const First_Screen(),
    );
  }
}
