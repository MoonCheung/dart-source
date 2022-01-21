// 可以定义扩展名称，支持方法，成员，getter，setter，运算符
extension NumberParsing on String {
  // 字符串转换整数
  int parseInt() {
    return int.parse(this);
  }

  // 字符串转换浮点数
  double parseNum() {
    return double.parse(this);
  }
}
