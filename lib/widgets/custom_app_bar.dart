import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';
import '../helpers/datetime_helpers.dart';

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
            child: CustomClock(),
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

class CustomClock extends StatefulWidget {
  @override
  _CustomClockState createState() => _CustomClockState();
}

class _CustomClockState extends State<CustomClock> {
  Timer _clockTimer;

  @override
  void initState() {
    _clockTimer = Timer.periodic(
      Duration(seconds: 1),
      (timer) => setState(
        () {},
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    if (_clockTimer != null) _clockTimer.cancel();
    _clockTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _now = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dateStringMaker(_now),
          style: TextStyle(
            fontFamily: "Rubik",
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          timeStringMaker(_now),
          style: TextStyle(
            fontFamily: "Rubik",
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
