import 'package:flutter_demo/router/app_page.dart';
import 'package:get/get.dart';

class GetOneLogic extends GetxController {
  // 声明整型变量
  int count = 0;

  // 跳转第二页面
  void toTwoPage() {
    Get.toNamed('/getx/${RouteName.getxacrosstwo}',
        arguments: {'msg': '我是上个页面传递过来的数据'});
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
