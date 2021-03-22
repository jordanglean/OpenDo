import 'package:flutter/material.dart';
// Routes
import 'package:open_do/routes/tasks_list.dart';

// Entry
void main() => runApp(MyApp());

// Node Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.deepOrange,
        
      ),
      home: TaskListRoute(),
    ); 
  }
}