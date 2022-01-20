import 'package:flutter_demo/views/getx/across_page/one/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AcrossTwoPage extends StatelessWidget {
  AcrossTwoPage({Key? key, required this.title}) : super(key: key);
  final String title;

  // 查找类并实例化
  final oneLogic = Get.find<GetOneLogic>();
  // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
  final twoLogic = Get.put(GetTwoLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            //计数显示
            GetBuilder<GetTwoLogic>(
              builder: (logic) {
                return Text('跨页面-Two点击了 ${twoLogic.count} 次',
                    style: const TextStyle(fontSize: 30.0));
              },
            ),

            //传递数据
            GetBuilder<GetTwoLogic>(
              builder: (logic) {
                return Text('传递的数据：${twoLogic.msg}',
                    style: const TextStyle(fontSize: 20.0));
              },
            ),
          ]),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () {
                // 定义增量方法
                oneLogic.increment();
                twoLogic.increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () {
                if (twoLogic.count > 0) {
                  // 定义减量方法
                  oneLogic.decrement();
                  twoLogic.decrement();
                }
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
