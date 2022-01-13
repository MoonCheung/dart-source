import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxPages extends StatelessWidget {
  GetxPages({Key? key, required this.title}) : super(key: key);
  final String title;

  final List<String> entries = <String>['计数器-简单式', 'B', 'C', 'D', 'E', 'F'];
  final List<int> colorCodes = <int>[100, 200, 300, 400, 500, 600];
  final List<String> pathList = <String>['/getx/count_simple'];

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
                  Get.toNamed(pathList[index]);
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
