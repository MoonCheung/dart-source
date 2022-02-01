import 'package:flutter/material.dart';

import 'package:flutter_demo/views/provider/provider_count/state.dart';
import 'package:flutter_demo/views/provider/provider_count/logic.dart';

class ProviderCounter extends StatelessWidget {
  ProviderCounter({Key? key}) : super(key: key);
  // 控制器
  final controller = ChangeNotifierController();
  // 创建整型变量
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('计数器(通过Controller调用方法)')),
        body: ProviderCounterWidget(controller: controller),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () {
                controller.value = ++count;
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () {
                if (controller.value > 0) {
                  controller.value = --count;
                }
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
