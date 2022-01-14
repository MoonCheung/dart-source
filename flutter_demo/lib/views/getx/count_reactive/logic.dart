import 'package:get/get.dart';

class CounterRxController extends GetxController {
  // 声明响应式变量
  final _count = 0.obs;

  // 获取计数器的只读值
  int get count => _count.value;
  // 定义增量方法
  void increment() {
    _count.value++;
  }

  // 定义减量方法
  void decrement() {
    _count.value--;
  }
}
