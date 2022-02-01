import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ChangeNotifierController extends ChangeNotifier {
  // 创建整型变量
  String _value = '0';
  // 获取整型变量
  String get value => _value;

  set value(String newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }
}
