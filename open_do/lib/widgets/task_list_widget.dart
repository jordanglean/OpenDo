import 'package:flutter/material.dart';
// Models Import
import 'package:open_do/models/task_model.dart';

class TaskListWidget extends StatefulWidget {
  // Properties
  final List<TaskModel> _taskList;
  final Function _deleteTaskHandler;

  // Constructor
  TaskListWidget(this._taskList, this._deleteTaskHandler);

  @override
  _TaskListWidgetState createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {

  // Widget Build
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: (widget._taskList.isEmpty)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'No tasks added yet!',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'OpenSans',
                    letterSpacing: 2,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Image(
                    image: AssetImage('assets/images/sleep.png'),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: widget._taskList.length,
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                    child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget._taskList[index].taskName,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                              Text(
                                widget._taskList[index].taskDescription,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ]),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.done,
                          size: 28,
                          color: Colors.deepOrange,
                        ),
                        onPressed: () => widget._deleteTaskHandler(widget._taskList[index].taskCreatedDate),
                      ),
                    ],
                  ),
                ));
              }),
    );
  }
}
