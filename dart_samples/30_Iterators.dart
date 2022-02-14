void main() {
  // 迭代器 class
  var item = [1, 5, 10].iterator;
  while (item.moveNext()) {
    print(item.current);
  }

  // 可迭代对象 class
  var iterable = Iterable.generate(3);
  // 可迭代对象转换为可迭代器的列表
  var iter2 = iterable.map((n) => n * 2).iterator;
  while (iter2.moveNext()) {
    print(iter2.current);
  }
}
