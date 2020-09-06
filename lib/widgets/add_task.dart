import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:provider/provider.dart';
import '../enums.dart';

import '../providers/task_manager.dart';

class AddTaskBottomSheet extends StatefulWidget {
  final TaskStatus status;
  final Task defaultTask;
  AddTaskBottomSheet({this.status, this.defaultTask});
  @override
  _AddTaskBottomSheetState createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final formKey = GlobalKey<FormState>();
  int _month;
  Map task = {
    "title": "",
    "description": "",
    "year": "",
    "month": "",
    "day": "",
    "hour": "",
    "minute": "",
  };

  @override
  void initState() {
    if (widget.defaultTask != null) {
      final dt = widget.defaultTask;
      task["title"] = dt.title;
      task["description"] = dt.description;
      task["year"] = dt.deadLine.year.toString();
      task["month"] = dt.deadLine.month.toString();
      task["day"] = dt.deadLine.day.toString();
      task["hour"] = dt.deadLine.hour.toString();
      task["minute"] = dt.deadLine.minute.toString();
    }
    super.initState();
  }

  void submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print(task);
      //                "2012-02-27 13:27:00"
      final deadLine = DateTime.parse(
          "${task['year'].toString().padLeft(4, '0')}-${task['month'].toString().padLeft(2, '0')}-${task['day'].toString().padLeft(2, '0')}T${task['hour'].toString().padLeft(2, '0')}:${task['minute'].toString().padLeft(2, '0')}");
      // print(deadLine);
      // print(DateTime.parse(deadLine));
      if (widget.defaultTask != null) {
        Provider.of<TaskManager>(context, listen: false).editTask(
          id: widget.defaultTask.id,
          title: task["title"],
          description: task["description"],
          taskStatus: widget.status,
          deadLine: deadLine,
        );
      } else {
        Provider.of<TaskManager>(context, listen: false).addTask(
          title: task["title"],
          description: task["description"],
          taskStatus: widget.status,
          deadLine: deadLine,
        );
      }
      Navigator.of(context).pop();
    }
  }

  int daysNumberInMonth(int monthNum) {
    if (monthNum == null) {
      return null;
    } else if ([1, 3, 5, 7, 8, 10, 12].contains(monthNum)) {
      return 31;
    } else if ([4, 6, 9, 11].contains(monthNum)) {
      return 30;
    } else if (monthNum == 2) {
      return 28;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add A New Task:",
                      style: TextStyle(
                        fontFamily: "Rubik",
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    NeuButton(
                      bevel: 5,
                      decoration: NeumorphicDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(5),
                      onPressed: submit,
                      // color: Colors.grey,
                      child: Row(
                        children: [
                          Icon(Icons.save),
                          Text(
                            "Submit",
                            style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  initValue: task["title"],
                  labelText: "Title",
                  onSaved: (value) => task["title"] = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This field must be filled";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  initValue: task["description"],
                  labelText: "Description",
                  onSaved: (value) =>
                      task["description"] = value.isEmpty ? "" : value,
                  maxLines: 4,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Dead Line: ",
                  style: TextStyle(
                    fontFamily: "Rubik",
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        initValue: task["year"],
                        labelText: "Year",
                        onSaved: (value) => task["year"] = int.parse(value),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "This field must be filled";
                          } else if (int.tryParse(value) == null) {
                            return "Must be a number";
                          } else if (int.tryParse(value) <= 0) {
                            return "Must be greater than 0";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Slash(),
                    Expanded(
                      child: CustomTextField(
                        initValue: task["month"],
                        labelText: "Month",
                        onSaved: (value) => task["month"] = int.parse(value),
                        onChanged: (value) => _month = int.tryParse(value),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "This field must be filled";
                          } else if (int.tryParse(value) == null) {
                            return "Must be a number";
                          } else if (int.tryParse(value) <= 0) {
                            return "Must be greater than 0";
                          } else if (int.tryParse(value) > 12) {
                            return "Must be 12 or smaller";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Slash(),
                    Expanded(
                      child: CustomTextField(
                        initValue: task["day"],
                        labelText: "Day",
                        onSaved: (value) => task["day"] = int.parse(value),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "This field must be filled";
                          } else if (int.tryParse(value) == null) {
                            return "Must be a number";
                          } else if (int.tryParse(value) <= 0) {
                            return "Must be greater than 0";
                          } else if (daysNumberInMonth(_month) != null) {
                            if (int.tryParse(value) >
                                daysNumberInMonth(_month)) {
                              return "Must be ${daysNumberInMonth(_month)} or smaller";
                            }
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: CustomTextField(
                        initValue: task["hour"],
                        labelText: "Hour",
                        onSaved: (value) => task["hour"] = int.parse(value),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "This field must be filled";
                          } else if (int.tryParse(value) == null) {
                            return "Must be a number";
                          } else if (int.tryParse(value) < 0) {
                            return "Must be 0 or greater";
                          } else if (int.tryParse(value) > 23) {
                            return "Must be 23 or smaller";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Colon(),
                    Expanded(
                      child: CustomTextField(
                        initValue: task["minute"],
                        labelText: "Minute",
                        onSaved: (value) => task["minute"] = int.parse(value),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "This field must be filled";
                          } else if (int.tryParse(value) == null) {
                            return "Must be a number";
                          } else if (int.tryParse(value) < 0) {
                            return "Must be 0 or greater";
                          } else if (int.tryParse(value) > 60) {
                            return "Must be 60 or smaller";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Colon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        ":",
        style: TextStyle(
          fontFamily: "Rubik",
          fontSize: 30,
        ),
      ),
    );
  }
}

class Slash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        "/",
        style: TextStyle(
          fontFamily: "Rubik",
          fontSize: 30,
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final labelText;
  final maxLines;
  final String Function(String) validator;
  final void Function(String) onSaved;
  final void Function(String) onChanged;
  final initValue;
  CustomTextField({
    this.labelText,
    this.maxLines = 1,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.initValue,
  });

  @override
  Widget build(BuildContext context) {
    return NeuCard(
      curveType: CurveType.emboss,
      decoration: NeumorphicDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: TextFormField(
        scrollPadding: EdgeInsets.all(0),
        style: TextStyle(
          fontFamily: "Rubik",
          fontSize: 20,
        ),
        initialValue: initValue,
        maxLines: maxLines,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        decoration: InputDecoration(
          errorStyle: TextStyle(fontFamily: "Rubik", fontSize: 15),
          hintText: labelText,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
