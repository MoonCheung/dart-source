class Logger {
  // 工厂模式：单例公开访问
  factory Logger() => _getInstance();

  // 获取静态函数方法
  static Logger get instance => _getInstance();

  // 静态私有成员，没有初始化
  static Logger? _instance;

  // 私有构造函数
  Logger._internal() {
    print('私有构造函数~~');
  }

  // 静态、同步、私有访问点
  static Logger _getInstance() {
    if (_instance == null) {
      _instance = Logger._internal();
    }
    return _instance!;
  }
}

void main() {
  Logger logger1 = Logger();
  Logger logger2 = Logger.instance;
  // 不能实例化类，只能访问类的静态方法
  Logger._internal();
  print(identical(logger1, logger2));
}
