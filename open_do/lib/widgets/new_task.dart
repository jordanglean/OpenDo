import 'package:flutter/material.dart';

// New Task
class NewTask extends StatefulWidget {
  // Properties
  final Function _addTaskHandler;

  // Constructor
  NewTask(this._addTaskHandler);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  // Input Controllers
  final _taskNameController = TextEditingController();
  final _taskDescriptionController = TextEditingController();
  DateTime _dueDate;

  // Show Date Picker
  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(200020))
        .then((value) {
      setState(() {
        _dueDate = value;
      });
    });
  }

  // Submit Data
  void _submitData() {
    // User Input
    final _userTaskName = _taskNameController.text;
    final _userTaskDescription = _taskDescriptionController.text;

    // Validation
    if (_userTaskName.isEmpty || _userTaskDescription.isEmpty) {
      return;
    }

    // Add Task
    widget._addTaskHandler(
      taskName: _userTaskName,
      taskDescription: _userTaskDescription,
      dueDate: _dueDate,
    );

    Navigator.of(context).pop();
  }

  // Widget Built
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 400,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Create New Task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  letterSpacing: 2,
                ),
              ),
            ),
            Divider(),
            // Input
            TextField(
              controller: _taskNameController,
              decoration: InputDecoration(hintText: 'Task Name'),
            ),
            TextField(
              controller: _taskDescriptionController,
              decoration: InputDecoration(hintText: 'Description'),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: _dueDate == null
                        ? Text('Pick a date')
                        : Text('$_dueDate'),
                  ),
                  TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Set Due Date',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 10, minimumSize: Size(300, 40)),
                  onPressed: _submitData,
                  child: Text(
                    'Add Task',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
