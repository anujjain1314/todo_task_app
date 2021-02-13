import 'package:flutter/material.dart';
import 'package:todoeeyapp/constant.dart';

class BottomSheetAddTask extends StatelessWidget {
  final Function onAddTask;
  BottomSheetAddTask({@required this.onAddTask});
  @override
  Widget build(BuildContext context) {
    String _taskTitle;
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (inputValue) {
                  _taskTitle = inputValue;
                },
              ),
              FlatButton(
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  onAddTask(_taskTitle);
                },
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
          decoration: kTaskListBoxDecoration,
        ),
      ),
    );
  }
}
