// sync* 函数返回一个可迭代对象
Iterable<int> evenNumbersDownFrom(int n) sync* {
  // the body isn't executed until an iterator invokes moveNext()
  int k = n;
  while (k >= 0) {
    if (k % 2 == 0) {
      // 'yield' 暂停功能
      yield k;
    }
    k--;
  }

  // when the end of the function is executed,
  // there are no more values in the Iterable, and
  // moveNext() returns false to the caller
}

void main() {
  evenNumbersDownFrom(7).forEach(print);
}
