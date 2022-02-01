import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_demo/views/provider/count_simple/logic.dart';

class ProviderCounterSimple extends StatelessWidget {
  ProviderCounterSimple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.watch<ChangeNotifierController>().value;
    // debugPrint("watch context: ${context.watch<ChangeNotifierController>()}");
    return Scaffold(
        appBar: AppBar(title: const Text('计数器-简单版')),
        body: Center(
            child: Text(
          '${value > 0 ? '数值上升' : value < 0 ? '数值下降' : '初始值为空'}:$value',
          style: const TextStyle(fontSize: 30.0),
        )),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () =>
                  context.read<ChangeNotifierController>().increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () {
                if (value > 0) {
                  context.read<ChangeNotifierController>().decrement();
                }
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
