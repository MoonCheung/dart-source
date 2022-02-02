import 'package:flutter/material.dart';
import 'package:flutter_demo/views/provider/count_high/state.dart';

class ProviderCounterProvider extends ChangeNotifier {
  final state = ProviderCounterState();

  // 增量方法
  void increment() {
    state.count++;
    notifyListeners();
  }

  // 减量方法
  void decrement() {
    state.count--;
    notifyListeners();
  }
}
