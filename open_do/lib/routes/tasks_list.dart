import 'package:flutter/material.dart';
// Model Imports
import 'package:open_do/models/task_model.dart';
// Widget Import
import 'package:open_do/widgets/task_list_widget.dart';
import 'package:open_do/widgets/new_task.dart';

// Task List
class TaskListRoute extends StatefulWidget {
  @override
  _TaskListRouteState createState() => _TaskListRouteState();
}

class _TaskListRouteState extends State<TaskListRoute> {
  // Local Task Data Set
  final List<TaskModel> _taskListDataSet = [
    // TaskModel(
    //     taskName: 'Learn to code',
    //     taskDescription: 'Finish Flutter Complete Reference',
    //     taskDueDate: DateTime.now()),
  ];

  // Add New Task
  void addNewTask({String taskName, String taskDescription, DateTime dueDate}) {
    final newTk = TaskModel(
      taskName: taskName,
      taskDescription: taskDescription,
      taskDueDate: dueDate,
    );
    setState(() {
      _taskListDataSet.add(newTk);
    });
  }

  // Delete Task
  void deleteTask(DateTime id){
    setState(() {
      _taskListDataSet.removeWhere((task) => task.taskCreatedDate == id);
    });
  }

  // Modal Sheet
  void _startCreateNewTask(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_){
        return GestureDetector(
          onTap: (){},
          child: NewTask(addNewTask),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  // Widget Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('Open Do'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startCreateNewTask(context),
      ),
      body: Container(
        child: TaskListWidget(_taskListDataSet, deleteTask),
      ),
    );
  }
}
