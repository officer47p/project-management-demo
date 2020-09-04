import 'package:flutter/material.dart';
import '../enums.dart';
import '../consts.dart';
import './task_card.dart';
import './add_task.dart';
import 'package:provider/provider.dart';
import '../providers/task_manager.dart';

class TasksColumn extends StatelessWidget {
  final TaskStatus category;
  TasksColumn(this.category);

  // EdgeInsets innerContentPadding = EdgeInsets.all(10);

  String get categoryName {
    if (category == TaskStatus.Open)
      return "Open";
    else if (category == TaskStatus.InProgress)
      return "In Progress";
    else if (category == TaskStatus.Done) return "Done";
  }

  Color get categoryColor {
    if (category == TaskStatus.Open)
      return Colors.green;
    else if (category == TaskStatus.InProgress)
      return Colors.orange;
    else if (category == TaskStatus.Done) return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskManager>(context).getTasksByStatus(category);
    return Padding(
      padding: kTaskColumnDefaultMargin,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15, left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryName,
                  style: TextStyle(
                    fontFamily: "Rubik",
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                FlatButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: kTaskColumnDefaultBorderRadius,
                  ),
                  icon: Icon(Icons.add),
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => AddTaskBottomSheet(),
                    );
                  },
                  label: Text(
                    "Add Task",
                    style: TextStyle(
                      fontFamily: "Rubik",
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              // padding: innerContentPadding,
              decoration: BoxDecoration(
                borderRadius: kTaskColumnDefaultBorderRadius,
                boxShadow: [
                  BoxShadow(
                    color: categoryColor,
                    blurRadius: 7,
                    spreadRadius: 2,
                  )
                ],
                color: Color(0xff545454),
              ),
              child: tasks.isEmpty
                  ? Center(
                      child: Text(
                        "No Tasks To Show",
                        style: TextStyle(
                          fontFamily: "Rubik",
                          fontSize: 24,
                        ),
                      ),
                    )
                  : ListView(
                      physics: BouncingScrollPhysics(),
                      children: tasks
                          .map((task) => TaskCard(task, categoryColor))
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
