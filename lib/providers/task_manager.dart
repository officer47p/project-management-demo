import 'package:flutter/foundation.dart';
import 'dart:math' as math;

class Task {
  String id;
  String title;
  String description;
  DateTime deadLine;
  Task({this.id, this.title, this.description, this.deadLine});
}

class TaskManager extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask({String title, String description, DateTime deadLine}) {
    _tasks.add(Task(
      id: (math.Random().nextDouble() * 100000).toString(),
      title: title,
      description: description,
      deadLine: deadLine,
    ));
    notifyListeners();
  }

  void editTask(
      {String id, String title, String description, DateTime deadLine}) {
    final index = _tasks.indexWhere((element) => element.id == id);
    _tasks[index] = Task(
        id: id, title: title, description: description, deadLine: deadLine);
  }

  Task getTaskById(String id) {
    return _tasks.firstWhere(
      (element) => element.id == id,
      orElse: () => null,
    );
  }

  void deleteTask(String id) {
    _tasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
