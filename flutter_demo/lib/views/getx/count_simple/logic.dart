import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;

  // 自定义方法
  increase() {
    count++;
    update();
  }
}
