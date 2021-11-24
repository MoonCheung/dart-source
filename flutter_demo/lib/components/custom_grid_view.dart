import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key, required this.lists}) : super(key: key);
  // 传入列表数据
  final List<dynamic> lists;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: GridView.builder(
            itemCount: lists.length,
            // 它使用此委托来控制其图块的布局
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              final listData = lists[index];
              print('watch simpleRecipe:${listData}');
              return listData;
            }));
  }
}
