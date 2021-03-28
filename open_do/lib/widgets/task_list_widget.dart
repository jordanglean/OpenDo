import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_do/widgets/task_card_details.dart';
// Models Import
import 'package:open_do/models/task_model.dart';

class TaskListWidget extends StatefulWidget {
  // Properties
  final List<TaskModel> _taskList;
  final Function _deleteTaskHandler;
  final Function _editTaskHandler;

  // Constructor
  TaskListWidget(
      this._taskList, this._deleteTaskHandler, this._editTaskHandler);

  @override
  _TaskListWidgetState createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  double _heightAnimatedContainer = 90.0;

  // Widget Build
  @override
  Widget build(BuildContext context) {
    return (widget._taskList.isEmpty)
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
              return AnimatedContainer(
                height: _heightAnimatedContainer,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _heightAnimatedContainer =
                          _heightAnimatedContainer == 90.0 ? 300 : 90.0;
                    });
                  },
                  child: _heightAnimatedContainer == 90
                      ? Card(
                          color: Colors.blueGrey.shade100,
                          margin: EdgeInsets.all(5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      widget._taskList[index].taskName,
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                    Text(DateFormat.yMMMd().format(widget
                                        ._taskList[index].taskCreatedDate)),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.done,
                                    size: 32,
                                    color: Colors.deepOrange,
                                  ),
                                  onPressed: () => widget._deleteTaskHandler(
                                      widget._taskList[index].taskCreatedDate),
                                ),
                              ],
                            ),
                          ),
                        )
                      : TaskCardDetails(
                          widget,
                          index,
                          widget._taskList,
                          widget._deleteTaskHandler,
                          widget._editTaskHandler,
                        ),
                ),
              );
            },
          );
  }
}
