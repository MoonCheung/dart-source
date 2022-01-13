import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GetxCountPage extends StatelessWidget {
  GetxCountPage({Key? key}) : super(key: key);

  final logic = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('计数器-简单式')),
      body: Center(
        child: GetBuilder<CounterController>(builder: (logic) {
          return Text(
            '点击了 ${logic.count} 次',
            style: TextStyle(fontSize: 30.0),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
