import 'package:flutter/material.dart';
import '../components/grocery_tile.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  GroceryListScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;
    // TODO 26: Replace with ListView
    return Padding(
        // 用于填充空间
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
            // 数组长度
            itemCount: groceryItems.length,
            // 用于遍历列表
            itemBuilder: (context, index) {
              final item = groceryItems[index];
              // TODO 28: Wrap in a Dismissable
              // 5
              return Dismissible(
                key: Key(item.id),
                direction: DismissDirection.endToStart,
                background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: const Icon(Icons.delete_forever,
                        color: Colors.white, size: 50.0)),
                onDismissed: (direction) {
                  // 给定索引，让杂货店经理处理删除项目
                  manager.deleteItem(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                      // 删除后底部提示
                      SnackBar(content: Text('${item.name} dismissed')));
                },
                child: InkWell(
                    child: GroceryTile(
                      key: Key(item.id),
                      item: item,
                      // 6
                      onComplete: (change) {
                        // 7
                        if (change != null) {
                          manager.completeItem(index, change);
                        }
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroceryItemScreen(
                                    originalItem: item,
                                    onCreate: (item) {
                                      manager.updateItem(item, index);
                                      // 从导航栈出栈
                                      Navigator.pop(context);
                                    },
                                    // 当用户更新时调用
                                    onUpdate: (item) {},
                                  )));
                    }),
              );
            },
            // 用于每个item的分隔设置
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16.0);
            }));
  }
}
