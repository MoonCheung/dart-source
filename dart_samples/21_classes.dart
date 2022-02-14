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
  // 举例子：
  // Position(); // 这是默认未命名的构造函数
  // Position.named() // 这是命名的构造函数，也许您希望您的类具有多个构造函数，以便可以以不同的方式构造您的类的实例。Dart 不支持重载函数，所以如果你想要多个构造函数，它们需要不同的名称。因此，如果您需要多个构造函数，则需要命名其中一些以区分它们。即使您没有多个构造函数，您也可能需要一个明确的名称以避免歧义。
  // Position._named() // 在 Dart 中，以下划线开头的名称是 Dart 库的私有名称（通常表示 .dart 文件）。Position._named()只是一个命名构造函数，不能在库之外使用。通常，当类想要强制调用者使用公共工厂构造函数（或静态方法）来获取实例时，您会看到私有构造函数，特别是当类想要拥有单个实例时。
  // Position._(); // 这相当于 Position._named()。它不是默认构造函数，它仍然是一个私有的命名构造函数（即调用者必须使用 Position._() 来调用它）
}

class MyUtils {
  static void printMessage() {
    print('Woolha.com');
  }
}

class MyExtendedUtils extends MyUtils {
  // The class 'MyUtils' doesn't have a constructor named '_'
  MyExtendedUtils() : super();
}

void main() {
  var origin = new Position()
    ..x = 0
    ..y = 0;

  var p = new Position()
    ..x = -5
    ..y = 6;

  print('Position: ${origin.distanceTo(p)}');

  print('MyExtendedUtils: ${MyExtendedUtils.printMessage}');
}
