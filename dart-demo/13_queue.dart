import 'dart:collection';

void main(){
  // 省略 new
  // 队列针对添加到头部或尾部进行了优化 
  // 不能通过索引访问项目。
  var q = Queue.from([300, 200, 100, 500]);
  // 队列实现 Iterable：
  print('可迭代: ${q.takeWhile((i) => i > 100)}');

  // 消耗队列 
  while(q.first > 100) {
    q.removeFirst();
  }
  print('移除堆栈: ${q}');
}