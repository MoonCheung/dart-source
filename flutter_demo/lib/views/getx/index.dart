import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxPages extends StatelessWidget {
  GetxPages({Key? key, required this.title}) : super(key: key);
  final String title;

  final List<String> entries = <String>[
    '计数器-简单式',
    '计数器-响应式',
    '计数器-进阶版',
    '计数器-binding使用',
    '简单跨页面交互',
  ];
  final List<int> colorCodes = <int>[100, 200, 300, 400, 500, 600];
  final List<String> pathList = <String>[
    '/getx/count_simple',
    '/getx/count_rx',
    '/getx/count_advanced',
    '/getx/count_binding',
    '/getx/count_across_one',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  debugPrint('watch get path:${pathList[index]}');
                  if (index == 3) {
                    Get.defaultDialog(
                        title: "提示",
                        content: const Text('想进入计数器binding使用吗?，否则不想进去，请点击取消'),
                        textConfirm: '确定',
                        onConfirm: () {
                          Get.toNamed(pathList[index]);
                        },
                        textCancel: '取消',
                        onCancel: () {
                          debugPrint('这是取消按钮');
                        });
                  } else {
                    Get.toNamed(pathList[index]);
                  }
                },
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.amber[colorCodes[index]],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  child: Center(child: Text(entries[index])),
                ));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(color: Colors.transparent),
        ));
  }
}
