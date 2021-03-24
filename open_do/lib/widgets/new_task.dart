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
  DateTime _dueDate = DateTime.now();

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
              child: Text('Date'),
            ),
            TextButton(onPressed: _submitData, child: Text('Add Task')),
          ],
        ),
      ),
    );
  }
}
