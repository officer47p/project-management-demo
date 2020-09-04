import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: EdgeInsets.all(10).copyWith(bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        // color: Colors.black38,
        gradient: RadialGradient(colors: [
          // Color(0xff0f2027),
          Color(0xff111111),
          Color(0xff434343),
        ], radius: 10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "2020/02/02",
                  style: TextStyle(
                    fontFamily: "Rubik",
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "10:34:07",
                  style: TextStyle(
                    fontFamily: "Rubik",
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              "Task ~ Flow",
              style: TextStyle(
                fontFamily: "Lobster",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "olivescode@gmail.com",
                  style: TextStyle(
                      fontFamily: "Rubik", fontSize: 15, color: Colors.blue),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
