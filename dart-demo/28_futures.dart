import 'dart:async';

Future<String> get onReady {
  var dur = Duration(seconds: 1);
  var oneSecond = Future.delayed(dur);

  // then() returns a new future that completes
  // with the value of the callback.
  return oneSecond.then((_) {
    return 'loaded!';
  });
}

void main(){
  // 将回调传递给 then() 将调用 
  // 未来完成时的回调
  onReady.then((String status){
    print(status);
  });
  // Future 可以链式：
  onReady.then((print)).then((_) => {
    print('done!!!')
  });

  // Futures 可能会引发错误
  onReady.catchError(() {
    print('error!');
  });
}