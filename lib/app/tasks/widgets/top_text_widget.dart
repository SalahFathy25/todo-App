import 'package:flutter/material.dart';

import '../../../core/utils/strings.dart';
import '../../model/task.dart';

class TopTextWidget extends StatelessWidget {
  final Task? task;
  const TopTextWidget({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    final TextTheme texttheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 50,
            child: Divider(thickness: 2),
          ),
          RichText(
            text: TextSpan(
              text: task == null
                  ? MyString.addNewTask
                  : MyString.updateCurrentTask,
              style: texttheme.titleLarge,
              children: const [
                TextSpan(
                  text: MyString.taskString,
                  style: TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 50,
            child: Divider(thickness: 2),
          )
        ],
      ),
    );
  }
}
