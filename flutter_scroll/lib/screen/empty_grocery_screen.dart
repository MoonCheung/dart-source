import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 3: Replace and add layout widgets
    return Padding(
      padding: const EdgeInsets.all(30.0),
      // 2
      child: Center(
        // 3
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TODO 4: Add empty image
            Flexible(
                child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.asset(
                        'assets/fooderlich_assets/empty_list.png'))),
            // TODO 5: Add empty screen title
            const Text(
              'No Groceries',
              style: TextStyle(fontSize: 21.0),
            ),
            // TODO 6: Add empty screen subtitle
            const SizedBox(height: 16.0),
            const Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
                textColor: Colors.white,
                child: const Text('Browse Recipes'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.green,
                onPressed: () {
                  print('点击MaterialButton');
                  // NOTE: Provider.of()访问模型对象TabManager. goToRecipes()将索引设置为Recipes选项卡。这会通知使用正确的选项卡索引Consumer重建Home。
                  Provider.of<TabManager>(context, listen: false).goToRecipes();
                })
            // TODO 7: Add browse recipes button
          ],
        ),
      ),
    );
  }
}
