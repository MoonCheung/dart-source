import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GetxCountBindingPage extends StatelessWidget {
  GetxCountBindingPage({Key? key}) : super(key: key);
  // 注入实例类
  final logic = Get.find<CounterBindingController>();
  // 查找逻辑层的logic类被实例化，可以拿到state的属性
  final state = Get.find<CounterBindingController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('计数器-Binding使用'),
        ),
        body: Center(
          child: GetBuilder<CounterBindingController>(builder: (logic) {
            return Text(
              '点击了 ${state.count} 次',
              style: const TextStyle(fontSize: 30.0),
            );
          }),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () => logic.increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () {
                if (state.count > 0) logic.decrement();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
