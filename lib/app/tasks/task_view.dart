import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/app/tasks/cubit/task_cubit.dart';
import 'package:to_do_list_app/app/tasks/widgets/bottom_buttons.dart';

import '../model/task.dart';
import 'widgets/build_text_field_and_date_time_picker.dart';
import 'widgets/my_app_bar.dart';
import 'widgets/top_text_widget.dart';

class TaskView extends StatefulWidget {
  final Task? task;
  const TaskView({super.key, required this.task});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  late TaskCubit taskCubit;

  @override
  void initState() {
    super.initState();
    taskCubit = TaskCubit.of(context);
    if (widget.task != null) {
      taskCubit.titleController!.text = widget.task!.title;
      taskCubit.subtitleController!.text = widget.task!.subtitle;
      taskCubit.date = widget.task!.date;
      taskCubit.time = widget.task!.time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: const MyAppBar(),
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TopTextWidget(task: widget.task),
                      const BuildTextFieldAndDateTimePicker(),
                      bottomButtons(context, taskCubit, widget.task),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
