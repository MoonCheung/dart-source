import 'package:flutter/material.dart';
// 第一个计数器例子
import './home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
