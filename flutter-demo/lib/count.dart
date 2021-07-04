import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  Count({Key key}) : super(key: key);
  CountState createState() => CountState();
}

class CountState extends State<Count> with WidgetsBindingObserver {
  int counter = 0;

  // 绘制界面
  @override
  Widget build(BuildContext context) {
    print("计算计数器 build......");
    return Scaffold(
        appBar: AppBar(title: Text('计数器')),
        body: Center(
            child: ElevatedButton(
          // 点击事件方法
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: CountNum(number: counter),
        )));
  }
}

class CountNum extends StatefulWidget {
  final int number;
  CountNum({Key key, this.number}) : super(key: key);

  // 创建该方法的状态
  @override
  CountNumState createState() => CountNumState();
}

class CountNumState extends State<CountNum> with WidgetsBindingObserver {
  //绘制界面
  @override
  Widget build(BuildContext context) {
    print("widget number build......");
    return Text('点击按钮查看状态变化 count: ${widget.number}');
  }
}
