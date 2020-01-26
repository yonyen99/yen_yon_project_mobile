import 'package:flutter/material.dart';
import 'package:yon_yen_project_mobiles/todo.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}
//Create array list TodoList to store value 
class _TodoListState extends State<TodoList> {
  List<Todo> todos = [];
  TextEditingController controller = new TextEditingController();
  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }
  ///create function _bulidItem to check checkbox.
  Widget _bulidItem(BuildContext context, int index) {
    final todo = todos[index];
    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked) {
        _toggleTodo(todo, isChecked);
      },
    );
  }
//function _addTodo() to show allert with button add and cancel.
  _addTodo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("New todo"),
            content: TextField(
              controller: controller,
              autofocus: true,
            ),
            ///button create cancel
            actions: <Widget>[
              MaterialButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                  controller.clear();
                },
              ),
              ///button create add
              MaterialButton(
                child: Text("Add"),
                onPressed: () {
                  setState(() {
                    final todo = new Todo(title: controller.value.text);
                    if (controller.value.text == "") {
                      print(" ");
                    } else {
                      todos.add(todo);
                    }
                    controller.clear();
                    Navigator.of(context).pop();
                  });
                },
              ),
            ],
          );
        });
  }
  //use ListView.builder to get _addTodo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: ListView.builder(
        itemBuilder: _bulidItem,
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}
