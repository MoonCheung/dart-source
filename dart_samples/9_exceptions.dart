class FoodSpoiledError extends StateError {
  FoodSpoiledError(String msg) : super(msg);
}

class Potato {
  int age;

  Potato(this.age);

  String peel() {
    if (age > 4) {
      throw new FoodSpoiledError('your potato is spoiled');
    }
    return "peeled";
  }
}

void main() {
  var p = new Potato(7);

  try {
    p.peel();
  } on FoodSpoiledError catch (_) {
    print("nope nope nope");
  }

  // 任何非空物体都可以抛出:
  try {
    throw ("potato");
  } catch (_) {
    print("caught a flying potato");
  }

  // 例外停止执行
  p.peel();
  print('not reached');
}
