import 'dart:math';

// 编译时可以定义常量使用
const name = "greg";
// 这个对象可在编译时声明常量
const Rectangle bounds = const Rectangle(0, 0, 5, 5);

void main(){
  print('name: ${name}');
  print('bounds: ${bounds}');
}