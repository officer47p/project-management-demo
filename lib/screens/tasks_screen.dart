import 'package:flutter/material.dart';
import '../enums.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/tasks_column.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<TaskStatus> categories = [
    TaskStatus.Open,
    TaskStatus.InProgress,
    TaskStatus.Done
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Row(
              children: categories
                  .map(
                    (e) => Expanded(
                      child: TasksColumn(e),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
