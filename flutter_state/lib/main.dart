import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'data/memory_repository.dart';

import 'ui/main_screen.dart';
import 'mock_service/mock_service.dart';

Future<void> main() async {
  _setupLogging();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 提供多个应用程序
    return MultiProvider(
      providers: [
        // 使用ChangeNotifierProvider类型为 的MemoryRepository
        ChangeNotifierProvider<MemoryRepository>(
          // 设置lazy为 false，这会立即创建存储库，而不是等到您需要它
          lazy: false,
          // 创建存储库
          create: (_) => MemoryRepository(),
        ),
        // 3
        Provider(
          // 4
          create: (_) => MockService()..create(),
          lazy: false,
        ),
      ],
      // MaterialApp作为子部件返回
      child: MaterialApp(
        title: 'Recipes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
