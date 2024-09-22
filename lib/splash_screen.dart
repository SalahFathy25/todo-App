import 'package:animate_do/animate_do.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list_app/app/home/home_view.dart';
import 'package:to_do_list_app/core/utils/colors.dart';

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
      nextScreen: const HomeView(),
      splashIconSize: 400,
      backgroundColor: MyColors.primaryColor,
    );
  }
}
