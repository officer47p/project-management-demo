import 'package:flutter/material.dart';
import '../enums.dart';
import '../consts.dart';
import './task_card.dart';

class TasksColumn extends StatelessWidget {
  final TaskStatus category;
  TasksColumn(this.category);

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
      return Colors.amber;
    else if (category == TaskStatus.Done) return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
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
                    fontSize: 25,
                  ),
                ),
                FlatButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: kTaskColumnDefaultBorderRadius,
                  ),
                  icon: Icon(Icons.add),
                  onPressed: () {},
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
              child: ListView(
                children: [
                  // TaskCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
