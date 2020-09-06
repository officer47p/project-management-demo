import 'package:flutter/material.dart';
import '../enums.dart';
import '../consts.dart';
import './task_card.dart';
import './add_task.dart';
import 'package:provider/provider.dart';
import '../providers/task_manager.dart';
import 'package:neumorphic/neumorphic.dart';

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
                NeuButton(
                  bevel: 7,
                  decoration: NeumorphicDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) =>
                          AddTaskBottomSheet(status: category),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text(
                        "Add Task",
                        style: TextStyle(
                          fontFamily: "Rubik",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DragTarget<Task>(
              onWillAccept: (data) => data.taskStatus != category,
              onAccept: (data) =>
                  Provider.of<TaskManager>(context, listen: false)
                      .changeTaskStatus(data.id, category),
              builder: (context, candidateData, rejectedData) => Container(
                decoration: BoxDecoration(
                  borderRadius: kTaskColumnDefaultBorderRadius,
                  boxShadow: [
                    BoxShadow(
                      color: categoryColor,
                      blurRadius: 7,
                      spreadRadius: 2,
                    )
                  ],
                  color: Color(0xff2A2A2A),
                  //  Color(0xff545454),
                ),
                child: tasks.isEmpty
                    ? Center(
                        child: Text(
                          "No $categoryName Task To Show\n🙄",
                          style: TextStyle(
                            fontFamily: "Rubik",
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
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
          ),
        ],
      ),
    );
  }
}
