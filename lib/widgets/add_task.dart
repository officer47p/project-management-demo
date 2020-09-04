import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  _AddTaskBottomSheetState createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add A New Task:",
                style: TextStyle(
                  fontFamily: "Rubik",
                  fontSize: 30,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelText: "Title",
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                labelText: "Description",
                maxLines: 4,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Date: ",
                    style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Year",
                    ),
                  ),
                  Slash(),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Month",
                    ),
                  ),
                  Slash(),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Day",
                    ),
                  ),
                  Text(
                    " Time: ",
                    style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Hour",
                    ),
                  ),
                  Colon(),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Minute",
                    ),
                  ),
                ],
              )
            ],
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
  CustomTextField({this.labelText, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      scrollPadding: EdgeInsets.all(0),
      style: TextStyle(
        fontFamily: "Rubik",
        fontSize: 20,
      ),
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
