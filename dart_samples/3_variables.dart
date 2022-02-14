void main() {
  // var 声明一个变量，dart会推断类型
  var a = 'initial';
  // 覆盖原有变量
  a = 'cover';
  print('as $a');

  // 也可以声明类型
  num b = 42;
  // 判断数据类型
  if (b is int) print('数字');

  // final变量一旦声明就不可更改
  final num c = 99;
  print(c);

  // const变量是编译时常量
  const double d = 44.00;
  print(d);
}
