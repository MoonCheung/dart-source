void main() {
  // 创建给定长度的列表，并在每个位置填充。 长度必须是非负整数, 参考地址：https://api.flutter-io.cn/flutter/dart-core/List/List.filled.html
  List<int> list = List<int>.filled(3, 0, growable: false);
  list[0] = 1;
  list[1] = 2;
  list[2] = 520;
  print('${list}');

  // 声明字符串数组类型，省略长度会创建一个可增长的列表。
  List<String> list1 = [];
  list1.addAll(['hello', 'world', 'list']);
  print('list is string type: ${list1}');

  // 也声明局部变量, 只能将整型数组赋值，其他类型会报错
  var list2 = <int>[];
  list2.addAll([1, 10, 11, 12]);
  print('list is int type: ${list2}');

  // 可以将不同类型推送list3的数组，<dynamic>[]是静态类型
  var list3 = <dynamic>[];
  list3.add(['hello', 'dynamic', 3, 520, {}]);
  print('list is dynamic type: ${list3}');

  // 在迭代期间修改可增长列表会导致 ConcurrentModificationErrors
  var array = [1, 10, 53];
  try {
    for (var item in array) {
      if (item > 10) {
        array.remove(item);
      }
    }
  } catch (e) {
    print('error: ${e}');
  }
}
