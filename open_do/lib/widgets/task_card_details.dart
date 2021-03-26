import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_do/widgets/task_list_widget.dart';
// Modeesl Import
import 'package:open_do/models/task_model.dart';

class TaskCardDetails extends StatelessWidget {
  // Constructor
  TaskCardDetails(
    this.widget,
    this.index,
    this._taskList,
  );

  // Properties
  final TaskListWidget widget;
  final _taskList;
  final index;

  // Widget Build
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade100,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _taskList[index].taskName,
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        Text(
                          'Due ${DateFormat.yMMMd().format(_taskList[index].taskDueDate)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ]),
                ),
                Divider(color: Theme.of(context).primaryColor),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey.shade900,
                  height: 180,
                  width: double.infinity,
                  child: Text(
                    _taskList[index].taskDescription,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          elevation: 0,
                          minimumSize: Size(150, 30),
                        ),
                        child: Text('Edit Task'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          elevation: 0,
                          minimumSize: Size(150, 30),
                        ),
                        child: Text('Delete Task'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
