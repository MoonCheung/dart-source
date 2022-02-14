import 'dart:async';

void main() {
  //创建单个订阅流
  Stream.fromIterable([1, 5, 7]).listen((i) {
    print('s1: $i');
  });

  // 使用其他流创建新流
  // using methods like where(), map(), expand(), take(), or skip()
  Stream.periodic(Duration(milliseconds: 300))
      .take(3)
      .listen((_) => print('s2: tick!'));

  Stream.fromIterable([2, 4, 8])
      .map((n) => n * 2)
      .listen((n) => print('s3: $n'));

  //多个消费者可以收听广播流。
  var sc = StreamController.broadcast();
  var broadcastStream = sc.stream;
  broadcastStream.listen((v) => print('s4: $v'));
  broadcastStream.listen((v) => print('s4: $v'));
  sc.add(1);
  sc.add(2);
}
