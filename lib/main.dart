import 'package:flutter/material.dart';
import 'package:todoeeyapp/model/task_data.dart';
import 'package:todoeeyapp/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => TaskData,
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
