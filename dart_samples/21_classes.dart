import 'dart:math';

class Position {
  // properties
  // late 关键词：声明初始化不可为空的整数类型
  late int x;
  late int y;

  // methods
  double distanceTo(Position other) {
    var dx = other.x - x;
    var dy = other.y - y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main(){
  var origin = new Position()
    ..x = 0
    ..y = 0;

  var p = new Position()
    ..x = -5
    ..y = 6;

  print('Position:${origin.distanceTo(p)}');
}