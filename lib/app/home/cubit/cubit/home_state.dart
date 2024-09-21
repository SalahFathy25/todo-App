part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<Task> tasks;

  HomeLoaded(this.tasks);
}

final class HomeError extends HomeState {
  final String error;

  HomeError(this.error);
}

final class HomeEmpty extends HomeState {
  final List<String> tasks;

  HomeEmpty(this.tasks);
}

class HomeUpdated extends HomeState {
  final List<Task> tasks;
  final int completed;

  HomeUpdated(this.tasks, this.completed);
}
