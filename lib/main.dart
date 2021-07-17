import 'package:flutter/material.dart';
import './screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu app',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Home()
    );
  }
}

