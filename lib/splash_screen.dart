import 'package:animate_do/animate_do.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list_app/app/home/home_view.dart';
import 'package:to_do_list_app/core/utils/colors.dart';

import 'app/data/hive_data_storage.dart';
import 'app/home/cubit/cubit/home_cubit.dart';
import 'core/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: Lottie.asset(splashLottieURL),
          ),
          FadeInUp(
            child: const Text(
              'To do App',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          )
        ],
      ),
      nextScreen: BlocProvider(
        create: (context) => HomeCubit(HiveDataStorage())..loadTasks(),
        child: const HomeView(),
      ),
      splashIconSize: 400,
      backgroundColor: MyColors.primaryColor,
      duration: 8800,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
