import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

//dart run build_runner build --delete-conflicting-outputs

@HiveType(typeId: 0)
class Task extends HiveObject {
  Task({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.date,
    required this.status,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String subtitle;
  @HiveField(3)
  final DateTime time;
  @HiveField(4)
  final DateTime date;
  @HiveField(5)
  bool status;

  factory Task.create({
    required String title,
    required String subtitle,
    DateTime? time,
    DateTime? date,
  }) =>
      Task(
        id: const Uuid().v1(),
        title: title,
        subtitle: subtitle,
        time: time ?? DateTime.now(),
        date: date ?? DateTime.now(),
        status: false,
      );

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      time: DateTime.parse(json['time']),
      date: DateTime.parse(json['date']),
      status: json['status'] as bool,
    );
  }

  // This is the toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'time': time.toIso8601String(),
      'date': date.toIso8601String(),
      'status': status,
    };
  }
}
