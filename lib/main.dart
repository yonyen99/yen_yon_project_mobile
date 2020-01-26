import 'package:flutter/material.dart';

import 'todo_list.dart';

void main() => runApp(MyApp());
//use statelessWidget 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
       home: TodoList(),
    );
  }
}
