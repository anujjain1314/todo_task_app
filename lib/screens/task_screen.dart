import 'package:flutter/material.dart';
import 'package:todoeeyapp/constant.dart';
import 'package:todoeeyapp/screens/add_task_screen.dart';
import 'package:todoeeyapp/model/task_model.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> task = [
    Task(name: "Buy Milk"),
    Task(name: "Kill your ex"),
    Task(name: "then kill your self")
  ];
  int get taskCount {
    return task.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, bottom: 30, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Todoey",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${task.length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: TaskList(
                tasks: task,
              ),
              decoration: kTaskListBoxDecoration,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => BottomSheetAddTask(
              onAddTask: (newTaskTitle) {
                setState(() {
                  task.add(Task(name: newTaskTitle));
                  Navigator.pop(context);
                });
              },
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList({@required this.tasks});
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return RowTask(widget.tasks[index].name, widget.tasks[index].isDone,
            (value) {
          setState(() {
            widget.tasks[index].toggleDone();
          });
        });
      },
      itemCount: widget.tasks.length,
    );
  }
}

class RowTask extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  final Function onChecked;

  RowTask(this.taskName, this.isChecked, this.onChecked);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        taskName,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: onChecked,
      ),
    );
  }
}
