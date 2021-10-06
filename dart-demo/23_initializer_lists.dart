import 'dart:math';

class Position {
  final int x;
  final int y;
  final double rad;

  // 初始化列表
  // 在构造函数体之前定义的字段
  // 这是最终字段所必需的
  Position(int x, int y)
    : this.x = x,
      this.y = y,
      rad = atan2(y, x);
}

void main(){
  var p = new Position(2, 3);
  print('x: ${p.x} y: ${p.y}');
  print('rad: ${p.rad}');
}