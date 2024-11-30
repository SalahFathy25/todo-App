import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/cubit/apptheme_cubit.dart';
import 'app/cubit/theme_state.dart';
import 'app/data/hive_data_storage.dart';
import 'app/model/task.dart';
import 'core/utils/constants.dart';
import 'splash_screen.dart';

//showcaseview

final RouteObserver routeObserver = RouteObserver<PageRoute>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

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
    return BlocProvider(
      create: (context) => AppthemeCubit()..changeTheme(ThemeState.initial),
      child: BlocBuilder<AppthemeCubit, AppThemeState>(
        builder: (context, state) {
          if (state is LightAppTheme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Todo App',
              theme: ThemeData.light(),
              navigatorObservers: [routeObserver],
              home: const SplashScreen(),
            );
          } else if (state is DarkAppTheme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Todo App',
              theme: ThemeData.dark(),
              navigatorObservers: [routeObserver],
              home: const SplashScreen(),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Todo App',
            navigatorObservers: [routeObserver],
            themeMode: ThemeMode.system,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}


//BlocProvider.of<AppthemeCubit>(context).changeTheme(light/dark)