// import 'string_apis.dart'; // 默认导入扩展方法
// import 'string_apis.dart' hide NumberParsing; // 导入扩展方法，并且隐藏掉NumberParsing
// import 'string_apis.dart' show NumberParsing; // 导入扩展方法，并且显示NumberParsing

// 导入2个相同扩展方法，其中导入扩展文件可以别名
import 'string_apis.dart';
import 'string_apis_1.dart' as copy;

void main() {
  // 第一次练习
  // print("打印填充左部：${'42'.padLeft(5)}");
  // print("打印填充右部：${'40'.padRight(5)}");
  // String d = '2';
  // print(d.parseInt());

  // 第二次练习
  // 导入2个相同扩展方法之后打印输出
  // 使用 string_apis.dart 中的 ParseNumbers 扩展。
  print(NumberParsing('23333').parseInt());
  // 使用 string_apis_1.dart 中的 ParseNumbers 扩展
  print(copy.NumberParsing('233334').parseInt());
  // 只有 string_apis_1.dart 有 parseNum()
  print('2021.1218'.parseNum());

  List list = ['dart', 'futter', 'javascript'];

  List<int> number = <int>[2, 3, 4, 5, 6, 5, 12, 1, 10];

  // 第三次练习
  print('数组长度：${list.doubleLength}');
  print('反转字符串：${-list}');
  print('数组指定分隔：${number.split(2)}');
}
