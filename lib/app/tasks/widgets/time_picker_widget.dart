import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../cubit/task_cubit.dart';

Widget timePickerWidget(BuildContext context, TaskCubit taskCubit) {
  return Container(
    height: 300,
    color: Theme.of(context).scaffoldBackgroundColor,
    child: Column(
      children: [
        SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: taskCubit.time ?? DateTime.now(),
            onDateTimeChanged: (DateTime value) {
              taskCubit.setTime(value);
            },
          ),
        ),
        CupertinoButton(
          borderRadius: BorderRadius.circular(50),
          child: const Text(
            'Done',
            style: TextStyle(
              color: MyColors.primaryColor,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            FocusManager.instance.primaryFocus?.unfocus();
          },
        )
      ],
    ),
  );
}
