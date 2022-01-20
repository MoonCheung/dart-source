import 'package:get/get.dart';

class GetTwoLogic extends GetxController {
  int count = 0;
  String msg = '';

  @override
  void onReady() {
    super.onReady();
    msg = Get.arguments['msg'];
    update();
  }

  // 跳转到跨页面回调该下面方法
  // 定义增量方法
  void increment() {
    count++;
    update();
  }

  // 定义减量方法
  void decrement() {
    count--;
    update();
  }
}
