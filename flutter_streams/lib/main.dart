import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import 'package:provider/provider.dart';
import 'data/memory_repository.dart';
// import 'mock_service/mock_service.dart';
import 'ui/main_screen.dart';
import 'data/repository.dart';
import 'network/recipe_service.dart';
import 'network/service_interface.dart';

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
    return MultiProvider(
      providers: [
        Provider<Repository>(
          lazy: false,
          create: (_) => MemoryRepository(),
        ),
        Provider<ServiceInterface>(
          lazy: false,
          create: (_) => RecipeService.create(),
        ),
      ],
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
