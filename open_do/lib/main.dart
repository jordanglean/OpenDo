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
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
          ),
          headline2: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
          ),
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 12,
          ),
        ),
      ),
      home: TaskListRoute(),
    );
  }
}