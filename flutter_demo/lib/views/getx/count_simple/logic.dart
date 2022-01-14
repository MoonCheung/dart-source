import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0;

  // 自定义方法
  increment() {
    count++;
    update();
  }
}
