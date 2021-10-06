class Position{
  final int x;
  final int y;
  Position(this.x) : y = 0;
}


void main(){
  // final 变量是单赋值的
  final a = 'hello';

  try {
    // 运行时错误；已分配
    a = 'goodbay';
  }catch(e){
    print('a error:${e}');
  }

  var pos = new Position(4);

  try {
    pos.x = 100; // 运行时错误
  } catch(e) {
    print('pos error:${e}');
  }
}