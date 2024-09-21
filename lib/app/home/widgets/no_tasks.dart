import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/strings.dart';

Widget noTasks(dynamic texttheme) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      FadeInUp(
        from: 30,
        child: Lottie.asset(
          lottieURL,
          width: 200,
          height: 200,
          animate: true,
        ),
      ),
      FadeInUp(
        from: 30,
        child: Text(
          MyString.doneAllTask,
          style: texttheme.titleMedium,
        ),
      )
    ],
  );
}
