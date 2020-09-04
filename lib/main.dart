import 'package:flutter/material.dart';
import './consts.dart';
import './enums.dart';

import './widgets/tasks_column.dart';
import './widgets/custom_app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
