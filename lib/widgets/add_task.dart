import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

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
                    onPressed: () {},
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
                  // Text(
                  //   "Date: ",
                  //   style: TextStyle(
                  //     fontFamily: "Rubik",
                  //     fontSize: 30,
                  //   ),
                  // ),
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
                  // Text(
                  //   " Time: ",
                  //   style: TextStyle(
                  //     fontFamily: "Rubik",
                  //     fontSize: 30,
                  //   ),
                  // ),
                  SizedBox(
                    width: 40,
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
              ),
              // SizedBox(
              //   height: 15,
              // ),
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
  final validator;
  final onSaved;
  CustomTextField(
      {this.labelText, this.maxLines = 1, this.validator, this.onSaved});

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
        maxLines: maxLines,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
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
