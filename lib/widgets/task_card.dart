import 'package:flutter/material.dart';
import '../consts.dart';

class TaskCard extends StatelessWidget {
  final Color categoryColor;
  TaskCard(this.categoryColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      // height: 300,
      decoration: BoxDecoration(
        color: Color(0xff737373),
        borderRadius: kTaskColumnDefaultBorderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
          )
        ],
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
                  "This is the title",
                  style: TextStyle(
                    fontFamily: "Rubik",
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.left,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                        color: Colors.blue,
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                        color: Colors.red,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "This is the description. Normally it's longer and contains\nline breaks that user specifys.",
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
                Chip(
                  avatar: Icon(Icons.date_range),
                  label: Text(
                    "2020/4/9 21:00:00",
                    style: TextStyle(fontFamily: "Rubik"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
