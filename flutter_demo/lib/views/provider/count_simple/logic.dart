import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ChangeNotifierController extends ChangeNotifier {
  // 创建整型变量
  int _value = 0;
  // 获取整型变量
  int get value => _value;

  set value(int newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }

  // 增量方法
  void increment() {
    value++;
  }

  // 减量方法
  void decrement() {
    value--;
  }
}
