import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_demo/views/provider/count_high/logic.dart';

class ProviderCounterHigh extends StatelessWidget {
  const ProviderCounterHigh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 局部侦听实例ChangeNotifier类
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProviderCounterProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<ProviderCounterProvider>();
    final state = provider.state;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider 计数器-High版'),
        ),
        body: Center(
            child: EasyBuilder<ProviderCounterProvider>(
                // Selector 将使用 Provider.of 获取一个值，然后将该值传递给 selector。然后，该选择器回调的任务是返回一个对象，该对象仅包含构建器完成所需的信息。
                () => Selector<ProviderCounterProvider, int>(
                      //它获取一些 InheritedWidget 并将它们的内容映射到一个只有有限数量属性的新对象中。
                      selector: (context, provider) => state.count,
                      // 从子级和选择器的最后一个结果构建小部件树的函数。
                      builder: (context, value, child) {
                        return Text(
                            '${value > 0 ? '数值上升' : value < 0 ? '数值下降' : '初始值为空'}:$value',
                            style: const TextStyle(fontSize: 30.0));
                      },
                    ))),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () => provider.increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () => provider.decrement(),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}

///自定义Builder
class EasyBuilder<T> extends StatelessWidget {
  const EasyBuilder(
    this.builder, {
    Key? key,
  }) : super(key: key);

  final Widget Function() builder;

  @override
  Widget build(BuildContext context) {
    return builder();
  }
}
