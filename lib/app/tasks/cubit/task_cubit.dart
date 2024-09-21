import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/app/data/hive_data_storage.dart';
import 'package:to_do_list_app/core/utils/constants.dart';

import '../../model/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final HiveDataStorage hiveDataStorage;

  TaskCubit(this.hiveDataStorage) : super(TaskInitial()) {
    titleController = TextEditingController();
    subtitleController = TextEditingController();
  }

  static TaskCubit of(BuildContext context) =>
      BlocProvider.of<TaskCubit>(context);

  TextEditingController? titleController;
  TextEditingController? subtitleController;

  DateTime? time;
  DateTime? date;

  @override
  Future<void> close() {
    titleController!.dispose();
    subtitleController!.dispose();
    return super.close();
  }

  void loadTasks() async {
    emit(TaskLoading());
    try {
      List<Task> tasks = await hiveDataStorage.getAllTasks();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void setTime(DateTime time) {
    final now = DateTime.now();
    this.time = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    emit(TaskTimeUpdate(this.time!));
  }

  String showTime(DateTime? time) {
    if (time == null) {
      return DateFormat('hh:mm a').format(DateTime.now()).toString();
    }
    return DateFormat('hh:mm a').format(time).toString();
  }

  void setDate(DateTime newDate) {
    date = newDate;
    emit(TaskDateUpdate(date!));
  }

  String showDate(DateTime? date) {
    if (date == null) {
      return DateFormat.yMMMEd().format(DateTime.now()).toString();
    } else {
      return DateFormat.yMMMEd().format(date).toString();
    }
  }

  void addTask(BuildContext context) {
    if (titleController!.text.isNotEmpty &&
        subtitleController!.text.isNotEmpty) {
      final newTask = Task.create(
        title: titleController!.text,
        subtitle: subtitleController!.text,
        time: time,
        date: date,
      );
      hiveDataStorage.addTask(newTask);
      loadTasks();
      Navigator.pop(context);
    } else {
      emptyFieldsWarning(context);
      emit(TaskError('All fields are required!'));
    }
  }

  void updateTask(BuildContext context, Task task) {
    if (titleController!.text.isNotEmpty &&
        subtitleController!.text.isNotEmpty) {
      final updatedTask = Task(
        id: task.id,
        title: titleController!.text,
        subtitle: subtitleController!.text,
        time: time!,
        date: date!,
        status: task.status,
      );
      hiveDataStorage.updateTask(updatedTask);
      loadTasks();
      Navigator.pop(context);
    } else {
      emptyFieldsWarning(context);
      emit(TaskError('All fields are required!'));
    }
  }

  void deleteTask(Task task) {
    hiveDataStorage.deleteTask(task);
    loadTasks();
  }

  bool hasTaskChanged(Task task) {
    return task.title != titleController!.text ||
        task.subtitle != subtitleController!.text;
  }
}
