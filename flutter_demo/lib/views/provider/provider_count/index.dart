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
        appBar: AppBar(title: const Text('Provider 计数器')),
        body: ProviderCounterWidget(controller: controller),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () {
                controller.value = '数值变化：${(++count).toString()}';
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            // const SizedBox(height: 10),
            // FloatingActionButton(
            //   heroTag: 'btn2',
            //   onPressed: () {
            //     final number = int.parse(controller.value);
            //     if (number > 0) {
            //       controller.value = '数值变化：${(count--).toString()}';
            //     }
            //   },
            //   tooltip: 'Decrement',
            //   child: const Icon(Icons.remove),
            // ),
          ],
        ));
  }
}
