import 'package:flutter/material.dart';
import 'wrapper.dart';

class AsyncAwait extends StatelessWidget {
  const AsyncAwait({Key? key, required this.title}) : super(key: key);
  final String title;

  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return WrapperWidget(
        onFun: () {
          print('这是包装类');
          _getThingsOnStartup().then((value) {
            print('Async done');
          });
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Container(
              child: const Center(child: Text('async container')),
            )));
  }
}
