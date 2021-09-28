void main(){
  // for 可遍历循环
  for(var i = 0; i < 3; i++){
    print('遍历:$i');
  }

  // for...in 可遍历循环
  const a = [3, 4, 5, 'hello', 'dart'];
  for(var i in a){
    print('for...in:$i');
  }
  // 声明callbacks作为final常量、var变量, 不可用const常量
  var callbacks = [];
  for(var i = 6; i<8; i++){
    callbacks.add(() => print(i));
  }
  callbacks.forEach((fn) => fn()); // 调用每个回调 
}