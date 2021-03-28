import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_do/widgets/task_list_widget.dart';
import 'package:open_do/models/task_model.dart';

class TaskCardDetails extends StatefulWidget {
  // Constructor
  TaskCardDetails(this.widget, this.index, this._taskList,
      this._deleteTaskHandler, this._editTaskHandler);

  // Properties
  final TaskListWidget widget;
  final _taskList;
  final index;
  final Function _deleteTaskHandler;
  final Function _editTaskHandler;

  @override
  _TaskCardDetailsState createState() => _TaskCardDetailsState();
}

class _TaskCardDetailsState extends State<TaskCardDetails> {
  // Create Edit Task Bottom Modal Sheet
  // - tex editing controllers
  final _textUpdateController = TextEditingController();
  final _descriptionUpdateController = TextEditingController();

  void _startCreateEditTask(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              child: Card(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _textUpdateController,
                      decoration: InputDecoration(
                          hintText: widget._taskList[widget.index].taskName
                              .toString()),
                    ),
                    TextField(
                      controller: _descriptionUpdateController,
                      decoration: InputDecoration(
                          hintText: widget
                              ._taskList[widget.index].taskDescription
                              .toString()),
                    ),
                    ElevatedButton(
                      child: Text('Update Task'),
                      onPressed: () {
                        widget._editTaskHandler(
                          widget.index,
                          _textUpdateController.text,
                          _descriptionUpdateController.text,
                        );
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

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
                          widget._taskList[widget.index].taskName,
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        Text(
                          'Due ${DateFormat.yMMMd().format(widget._taskList[widget.index].taskDueDate)}',
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
                    widget._taskList[widget.index].taskDescription,
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
                        // Edit Task Method
                        onPressed: () => _startCreateEditTask(context),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          elevation: 0,
                          minimumSize: Size(150, 30),
                        ),
                        child: Text('Delete Task'),
                        // Delete Task Method
                        onPressed: () => widget._deleteTaskHandler(
                            widget._taskList[widget.index].taskCreatedDate),
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
