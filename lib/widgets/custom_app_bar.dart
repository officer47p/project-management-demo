import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';
import '../helpers/datetime_helpers.dart';
import 'package:neumorphic/neumorphic.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      height: 56,
      curveType: CurveType.emboss,
      margin: EdgeInsets.all(10).copyWith(bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: NeumorphicDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
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
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: NeuButton(
                    bevel: 5,
                    decoration: NeumorphicDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          size: 18,
                        ),
                        Text(
                          "Log Out",
                          style: TextStyle(
                            fontFamily: "Rubik",
                            fontSize: 14,
                          ),
                        ),
                      ],
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
