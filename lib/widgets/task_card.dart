import 'package:flutter/material.dart';
import '../consts.dart';
import '../providers/task_manager.dart';
import 'package:provider/provider.dart';
import 'package:neumorphic/neumorphic.dart';
import './add_task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Color categoryColor;
  TaskCard(this.task, this.categoryColor);
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      bevel: 8,
      curveType: CurveType.flat,
      margin: EdgeInsets.all(10),
      width: double.infinity,
      // height: 300,
      decoration: NeumorphicDecoration(
        color: Color(0xff2A2A2A),
        // Color(0xff545454),
        borderRadius: kTaskColumnDefaultBorderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontFamily: "Rubik",
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    NeuButton(
                      bevel: 7,
                      decoration: NeumorphicDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        color: Color(0xff2A2A2A),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => AddTaskBottomSheet(
                            status: task.taskStatus,
                            defaultTask: task,
                          ),
                        );
                      },
                    ),
                    NeuButton(
                      bevel: 7,
                      decoration: NeumorphicDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Color(0xff2A2A2A),
                      ),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () =>
                          Provider.of<TaskManager>(context, listen: false)
                              .deleteTask(task.id),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              task.description,
              style: TextStyle(
                fontFamily: "Rubik",
                fontSize: 18,
                color: Colors.white70,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time Left:",
                  style: TextStyle(
                    fontFamily: "Rubik",
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                Chip(
                  backgroundColor: categoryColor,
                  avatar: Icon(Icons.timer),
                  label: Text(
                    "1H",
                    style: TextStyle(fontFamily: "Rubik"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dead Line:",
                  style: TextStyle(
                    fontFamily: "Rubik",
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                NeuCard(
                  curveType: CurveType.emboss,
                  decoration: NeumorphicDecoration(
                    color: Color(0xff2A2A2A),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.date_range),
                      Text(
                        "2020/4/9 21:00:00",
                        style: TextStyle(fontFamily: "Rubik"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
