import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
