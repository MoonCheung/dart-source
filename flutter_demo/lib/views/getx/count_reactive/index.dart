import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GetxCountReactivePage extends StatelessWidget {
  GetxCountReactivePage({Key? key}) : super(key: key);

  final CounterRxController logic = Get.put(CounterRxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('计数器-响应式'),
        ),
        body: Center(
          child: Obx(() {
            return Text(
              '点击了 ${logic.count} 次',
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
                if (logic.count > 0) logic.decrement();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
