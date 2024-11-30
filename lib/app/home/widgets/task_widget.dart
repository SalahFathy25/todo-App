import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/colors.dart';
import '../../data/hive_data_storage.dart';
import '../../model/task.dart';
import '../../tasks/cubit/task_cubit.dart';
import '../../tasks/task_view.dart';
import '../cubit/cubit/home_cubit.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => TaskCubit(HiveDataStorage()),
                  child: TaskView(
                    task: task,
                  ),
                ),
              ),
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 900),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: task.status
                  ? MyColors.primaryColor.withOpacity(.7)
                  : Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              leading: InkWell(
                onTap: () {
                  HomeCubit.of(context).toggleTaskStatus(task);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: task.status
                        ? MyColors.primaryColor.withOpacity(.7)
                        : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: .8,
                    ),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                task.title,
                style: TextStyle(
                  color: task.status
                      ? Colors.white
                      : dark
                          ? Colors.white
                          : Colors.black,
                  fontWeight: FontWeight.w500,
                  decoration: task.status ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.subtitle,
                    style: TextStyle(
                      color: task.status
                          ? Colors.white
                          : const Color.fromARGB(255, 164, 164, 164),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat('hh:mm a').format(task.time),
                          style: TextStyle(
                            fontSize: 13,
                            color: task.status
                                ? Colors.white
                                : const Color.fromARGB(255, 164, 164, 164),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat.yMMMEd().format(task.date),
                          style: TextStyle(
                            fontSize: 13,
                            color: task.status
                                ? Colors.white
                                : const Color.fromARGB(255, 164, 164, 164),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
