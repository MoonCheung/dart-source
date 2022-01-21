void main(){
  if (7 % 2 == 0) {
    print('7 is even');
  } else {
    print('7 is odd');
  }

  if (8 % 4 == 0) print('8 is divisble by 4');
  // 三元运算符
  const isActive = true;
  const result = isActive? '搬砖' : '摸鱼';
  print('今天工作是什么状态:$result');
}