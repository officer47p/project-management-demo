import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './consts.dart';
import './enums.dart';

import './screens/tasks_screen.dart';
import './providers/task_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskManager(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
