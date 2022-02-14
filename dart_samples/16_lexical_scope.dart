void main() {
  for (var i in Iterable.generate(1)) {
    print('not using "${i}"');
  }

  // 使用下划线使“未使用局部变量”静音
  // 运行 dartanalyzer 时的警告
  for (var _ in Iterable.generate(1)) {
    print('no warnings');
  }
}
