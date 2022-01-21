import 'dart:math';

class Position{
  late int x;
  late int y;
  // 一个简单的构造函数
  Position(this.x, this.y);

  // 可以使用命名构造函数定义其他构造函数
  Position.atOrigin() {
    x = 0;
    y = 0;
  }

  // 工厂函数
  factory Position.fromMap(Map m) {
    return new Position(m['x'], m['y']);
  }

  String toString() => "[$x, $y]";
}

void main(){
  print(new Position(30, 40));
  print(new Position.atOrigin());
  print(new Position.fromMap({'x': 4, 'y': 100}));
}
