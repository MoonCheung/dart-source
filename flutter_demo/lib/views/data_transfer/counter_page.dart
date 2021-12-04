import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  void _increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CountContainer(model: this, increment: _increment, child: Counter());
  }
}

// 声明自定义类来继承父类的小部件
class CountContainer extends InheritedWidget {
  CountContainer({
    Key? key,
    required this.model,
    required this.increment,
    required Widget child,
  }) : super(key: key, child: child);

  final _CounterPageState model;

  final Function() increment;

  static CountContainer of(BuildContext context) {
    final CountContainer? result =
        context.dependOnInheritedWidgetOfExactType<CountContainer>();
    assert(result != null, '在上下文中找不到 CountContainer ');
    return result!;
  }

  @override
  bool updateShouldNotify(CountContainer oldWidget) => model != oldWidget.model;
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountContainer state = CountContainer.of(context);

    return Scaffold(
      body: Center(
        child: Text(
          '你已经按下按钮很多次了 : ${state.model.count}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
