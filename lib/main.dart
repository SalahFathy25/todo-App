import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/app/data/hive_data_storage.dart';
import 'package:to_do_list_app/splash_screen.dart';

import 'app/model/task.dart';
import 'core/utils/theme.dart';

final RouteObserver routeObserver = RouteObserver<PageRoute>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter<Task>(TaskAdapter());
  var box = await Hive.openBox<Task>(HiveDataStorage.boxName);

  for (var task in box.values) {
    if (task.date.isBefore(DateTime.now())) {
      task.delete();
    } else {}
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: themeData,
      navigatorObservers: [routeObserver],
      home: const SplashScreen(),
    );
  }
}
