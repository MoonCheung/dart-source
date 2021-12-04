import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'dart:async';

class CustomEvent {
  CustomEvent(this.msg);
  String msg;
}

EventBus eventBus = EventBus();

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String msg = "通知:";
  late StreamSubscription subscription;

  // 初始化状态
  @override
  void initState() {
    super.initState();
    subscription = eventBus.on<CustomEvent>().listen((event) {
      print('event: ${event}');
      setState(() {
        msg += event.msg + '\n';
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    //State销毁时，清理注册
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(msg),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage())),
          child: Icon(Icons.navigate_next),
        ));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SecondPage')),
      body: Center(
          child: ElevatedButton(
              child: Text('发送消息'),
              onPressed: () => eventBus.fire(CustomEvent('我是消息')))),
    );
  }
}
