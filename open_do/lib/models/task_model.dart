import 'package:flutter/foundation.dart';

// Task Model
class TaskModel {
  // Properties
  final String taskName;
  final String taskDescription;
  final DateTime taskCreatedDate = DateTime.now();
  final DateTime taskDueDate;

  // Constructor
  TaskModel({
    @required this.taskName,
    this.taskDescription,
    this.taskDueDate,
  });
}
