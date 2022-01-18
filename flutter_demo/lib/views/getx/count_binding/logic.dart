import 'package:get/get.dart';
import 'state.dart';

class CounterBindingController extends GetxController {
  // 引入state层的state类实例的count
  final GetCounterBindingState state = GetCounterBindingState();

  // 定义增量方法
  void increment() {
    state.count++;
    update();
  }

  // 定义减量方法
  void decrement() {
    state.count--;
    update();
  }
}
