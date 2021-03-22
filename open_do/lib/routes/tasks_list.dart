import 'package:flutter/material.dart';

// Task List
class TaskListRoute extends StatefulWidget {
  @override
  _TaskListRouteState createState() => _TaskListRouteState();
}

class _TaskListRouteState extends State<TaskListRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('Open Do'),
      ),
      body: Container(
          //child: ListView.builder(itemBuilder: itemBuilder),
          ),
    );
  }
}
