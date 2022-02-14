void main() {
  var i = 0;
  // 条件在循环前进行评估
  while (i++ < 2) {
    print("while $i");
  }

  var j = 0;
  // 循环后评估做而已的情况
  do {
    print("dowhile $j");
  } while (j++ < 2);
}
