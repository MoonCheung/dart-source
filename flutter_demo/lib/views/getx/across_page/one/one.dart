import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AcrossOnePage extends StatelessWidget {
  AcrossOnePage({Key? key, required this.title}) : super(key: key);
  final String title;

  // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
  final logic = Get.put(GetOneLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(title)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.toTwoPage(),
        child: const Icon(Icons.arrow_forward_outlined),
      ),
      body: Center(
        child: GetBuilder<GetOneLogic>(
          builder: (logic) {
            return Text('跨页面-Two点击了 ${logic.count} 次',
                style: const TextStyle(fontSize: 30.0));
          },
        ),
      ),
    );
  }
}
