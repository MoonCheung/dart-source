import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderPage extends StatelessWidget {
  ProviderPage({Key? key, required this.title}) : super(key: key);
  final String title;

  final List<String> entries = <String>['（手动添加Provider类）数据列表'];
  final List<int> colorCodes = <int>[100, 200, 300, 400, 500, 600];
  final List<String> pathList = <String>[
    '/provider/list',
  ];

  @override
  Widget build(BuildContext context) {
    // 创建脚手架-小部件
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Get.toNamed(pathList[index]);
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.lime[colorCodes[index]],
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Center(child: Text(entries[index])),
              ));
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(color: Colors.transparent),
      ),
    );
  }
}
