import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/app/data/hive_data_storage.dart';

import '../../../model/task.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HiveDataStorage hiveDataStorage;

  HomeCubit(this.hiveDataStorage) : super(HomeInitial());

  static HomeCubit of(BuildContext context) =>
      BlocProvider.of<HomeCubit>(context);

  void loadTasks() async {
    emit(HomeLoading());
    try {
      List<Task> tasks = await hiveDataStorage.getAllTasks();
      tasks.sort((a, b) => b.time.compareTo(a.time));
      tasks.sort((a, b) => b.date.compareTo(a.date));
      emit(HomeLoaded(tasks));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void deleteAllTasks() async {
    await hiveDataStorage.deleteAllTasks();
    emit(HomeEmpty(const []));
  }

  void deleteTask(Task task) async {
    try {
      await hiveDataStorage.deleteTask(task);
      loadTasks();
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void toggleTaskStatus(Task task) async {
    task.status = !task.status;
    final doneTasks = (state is HomeLoaded)
        ? (state as HomeLoaded).tasks.where((task) => task.status).length
        : 0;

    emit(HomeUpdated((state as HomeLoaded).tasks, doneTasks));
    await hiveDataStorage.updateTask(task);
    loadTasks();
  }
}
