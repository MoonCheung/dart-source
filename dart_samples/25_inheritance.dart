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

void main() {
  var barry = new Dog('Barry');
  var pika = new Pikachu();
  releaseAnimals([barry, pika]);
}
