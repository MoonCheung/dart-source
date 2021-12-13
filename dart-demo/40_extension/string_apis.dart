// 可以定义扩展名称，支持方法，成员，getter，setter，运算符，操作符。扩展也可以有静态字段和静态辅助方法
extension NumberParsing on String {
  // 字符串转换整数
  int parseInt() {
    return int.parse(this);
  }
}

// 定义扩展名称列表
extension MyFancyList<T> on List<T> {
  int get doubleLength => length * 2;
  List<T> operator -() => reversed.toList();
  List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}
