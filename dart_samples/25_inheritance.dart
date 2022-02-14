/************************ 第一次Dart abstract、extends、implements *************************/
// 抽象类不能被实例化
// 但可以包含一些实现
abstract class Animal {
  String name;
  Animal(this.name);
  String get noise;
}

// 可以继承父类
class Dog extends Animal {
  Dog(String name) : super(name);
  String get noise => 'dog class';
}

// 类可以实现其他类（如果它们）
// 定义所有字段
class Pikachu implements Animal {
  String name = 'Pikachu';
  String get noise => 'pika class';
}

void releaseAnimals(Iterable animals) {
  animals.forEach((a) => print('${a.name} 已发布: ${a.noise}'));
}

/************************ 第二次Dart extends *************************/

// 定义交通工具类
class Vehicle {
  Vehicle(this.color);
  final String color;

  final String definition = 'Vehicle';
}

// 定义汽车类
// 继承Vehicle类的所有属性、所有方法、所有变量
class Car extends Vehicle {
  Car(String color) : super(color);

  // 可以覆盖父级的超类函数
  @override
  String get definition => 'Car is a ${super.definition}';
}

// 定义摩托类
// 不继承Vehicle类的所有属性、所有方法、所有变量，但您只想继承 Vehicle 类型。为此CarMarkets类必须实现 Vehicle 接口。
class CarMarkets implements Vehicle {
  CarMarkets(this.carColor);

  final String carColor;

  @override
  String get color => carColor;

  @override
  String get definition => '$carColor Car Markets';
}

// 定义自行车类
class Cycling extends Car {
  Cycling(String color) : super(color);
}

/************************ 第三次Dart implements *************************/
class Animals {}

// behaviors
abstract class Flyer {
  void fly() => print('I can fly!');
}

abstract class Swimmer {
  void swim() => print('I can swim!');
}

// with: Mixin 是一种不同类型的结构，它只能与关键字 with 一起使用，并且用于包含常见的代码片段，我会说，重用代码。
// class Bird extends Animals with Flyer {}
class Bird extends Animals implements Flyer {
  @override
  void fly() => print('I can fly!');
}

// with: Mixin 是一种不同类型的结构，它只能与关键字 with 一起使用，并且用于包含常见的代码片段，我会说，重用代码。
// class Duck extends Animals with Swimmer, Flyer {}
class Duck extends Animals implements Swimmer, Flyer {
  @override
  void fly() => print('I can fly!');

  @override
  void swim() => print('I can swim!');
}

void main() {
  var barry = new Dog('Barry');
  var pika = new Pikachu();
  releaseAnimals([barry, pika]);

  final cycling = Cycling('red');
  final car = Car('blue');
  print('Result: ${cycling is Vehicle}'); // true
  print(
      'Result: ${cycling.definition}'); // 打印：before: Vehicle，after: Car is a Vehicle
  print('Result: ${car.definition}'); // 打印：Car is a Vehicle

  final carMarkets = CarMarkets('green');
  print('Result: ${carMarkets.definition}'); // 打印：green car

  Bird();
  Duck();
}
