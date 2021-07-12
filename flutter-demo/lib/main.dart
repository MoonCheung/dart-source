import 'package:flutter/material.dart';
// 第一章节：计数器例子
import './home.dart';
// 第二章节：列表例子
import './listview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      // ThemeData 来统一管理主题的配置信息
      theme: ThemeData(
          brightness: Brightness.dark,
          //设置明暗模式为暗色
          accentColor: Colors.black,
          //(按钮）Widget前景色为黑色
          primaryColor: Colors.cyan,
          //主色调为青色
          iconTheme: IconThemeData(color: Colors.yellow),
          //设置icon主题色为黄色
          textTheme: TextTheme(body1: TextStyle(color: Colors.red))
          //设置文本颜色为红色
          ),
      home: List(title: '列表例子'),
      debugShowCheckedModeBanner: false,
    );
  }
}
