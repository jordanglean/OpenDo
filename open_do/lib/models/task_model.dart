import 'package:flutter/foundation.dart';

// Task Model
class TaskModel {
  // Properties
  final String taskName;
  final String taskDescription;
  final DateTime taskCreatedDate = DateTime.now();
  final DateTime taskDueDate;

  // Widget Properties
  double height;

  // Constructor
  TaskModel({
    @required this.taskName,
    this.taskDescription,
    this.taskDueDate,
    this.height,
  });
}
