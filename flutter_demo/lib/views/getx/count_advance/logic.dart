import 'package:get/get.dart';
import 'state.dart';

class CounterAdvanceController extends GetxController {
  // 引入state层的state类实例的count
  final GetCounterAdvanceState state = GetCounterAdvanceState();

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
