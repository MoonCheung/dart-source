import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'grocery_item_screen.dart';
import 'empty_grocery_screen.dart';
import '../models/models.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 4: Add a scaffold widget
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // TODO 11: Present GroceryItemScreen
            final manager = Provider.of<GroceryManager>(context, listen: false);
            print('watch manager:${manager}');
            Navigator.push(
                context,
                // 用特定于平台的过渡替换整个屏幕。例如，在 Android 中，它向上滑动并淡入。在 iOS 中，它从右侧滑入
                MaterialPageRoute(
                    builder: (context) => GroceryItemScreen(
                          onCreate: (item) {
                            // 推到manager
                            manager.addItem(item);
                            // 移除导航堆栈
                            Navigator.pop(context);
                          },
                          onUpdate: (item) {},
                        )));
          },
        ),
        body: buildGroceryScreen());
  }

  // TODO: Add buildGroceryScreen
  // NOTE 一个辅助函数，它决定构建哪个小部件树
  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (context, manager, child) {
      if (manager.groceryItems.isNotEmpty) {
        // TODO 25: Add GroceryListScreen
        return Container();
      } else {
        return EmptyGroceryScreen();
      }
    });
  }
}
