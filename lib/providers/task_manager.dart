import 'package:flutter/foundation.dart';
import 'dart:math' as math;
import '../enums.dart';

class Task {
  String id;
  String title;
  String description;
  DateTime deadLine;
  TaskStatus taskStatus;
  Task({this.id, this.title, this.description, this.deadLine, this.taskStatus});
}

class TaskManager extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
      title: "HEy",
      description: "kjdf d skfj dsjkf",
      deadLine: DateTime.now(),
      id: "fjdbskjfbsdjkb",
      taskStatus: TaskStatus.Done,
    )
  ];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(
      {String title,
      String description,
      DateTime deadLine,
      TaskStatus taskStatus}) {
    _tasks.add(Task(
      id: (math.Random().nextDouble() * 100000).toString(),
      title: title,
      description: description,
      deadLine: deadLine,
      taskStatus: taskStatus,
    ));
    notifyListeners();
  }

  void editTask(
      {String id,
      String title,
      String description,
      DateTime deadLine,
      TaskStatus taskStatus}) {
    final index = _tasks.indexWhere((element) => element.id == id);
    _tasks[index] = Task(
      id: id,
      title: title,
      description: description,
      deadLine: deadLine,
      taskStatus: taskStatus,
    );
  }

  Task getTaskById(String id) {
    return _tasks.firstWhere(
      (element) => element.id == id,
      orElse: () => null,
    );
  }

  List<Task> getTasksByStatus(TaskStatus taskStatus) {
    return _tasks.where((element) => element.taskStatus == taskStatus).toList();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
