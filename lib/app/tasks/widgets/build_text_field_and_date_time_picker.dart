import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/app/tasks/cubit/task_cubit.dart';

import '../../../core/utils/strings.dart';
import 'custom_text_form_field.dart';
import 'date_picker_widget.dart';
import 'time_picker_widget.dart';

class BuildTextFieldAndDateTimePicker extends StatelessWidget {
  const BuildTextFieldAndDateTimePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskCubit = TaskCubit.of(context);
    return SizedBox(
      width: double.infinity,
      height: 495,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              MyString.titleOfTitleTextField,
              style: const TextTheme().headlineMedium,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: CustomTextFormField(
              controller: TaskCubit.of(context).titleController!,
              hintText: '',
              maxLines: 6,
              cursorHeight: 50,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: TextFormField(
                controller: TaskCubit.of(context).subtitleController!,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  counter: Container(),
                  hintText: MyString.addNote,
                ),
                onFieldSubmitted: (value) {
                  TaskCubit.of(context).subtitleController!.text = value;
                },
                onChanged: (value) {
                  TaskCubit.of(context).subtitleController!.text = value;
                },
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return timePickerWidget(context, taskCubit);
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 10),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white12,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      MyString.timeString,
                      style: const TextTheme().headlineSmall,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 80,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: BlocBuilder<TaskCubit, TaskState>(
                        builder: (context, state) {
                          return Text(
                            taskCubit.showTime(taskCubit.time),
                            style: Theme.of(context).textTheme.titleSmall,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final selectedDate = await showCupertinoModalPopup<DateTime>(
                context: context,
                builder: (BuildContext context) {
                  return datePickerWidget(taskCubit, context);
                },
              );

              if (selectedDate != null) {
                taskCubit.setDate(selectedDate);
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 10),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white12,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      MyString.dateString,
                      style: const TextTheme().headlineSmall,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 120,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: BlocBuilder<TaskCubit, TaskState>(
                        builder: (context, state) {
                          if (state is TaskDateUpdate) {
                            return Text(
                              taskCubit.showDate(state.date),
                              style: Theme.of(context).textTheme.titleSmall,
                            );
                          }
                          return Text(
                            DateFormat.yMMMd().format(DateTime.now()),
                            style: Theme.of(context).textTheme.titleSmall,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
