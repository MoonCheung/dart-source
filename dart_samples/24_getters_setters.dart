import 'dart:math';

class Position {
  // 一个私有字段被声明
  int _x;
  int _y;

  Position(this._x, this._y);
  // getter
  double get rad => atan2(_y, _x);
  // setter
  void set x(int val) {
    _x = val;
  }
}

void main() {
  var p = new Position(2, 3);
  print('x: ${p._x} y: ${p._y}');
  print('rad: ${p.rad}');
}
