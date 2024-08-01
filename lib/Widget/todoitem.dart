import 'package:flutter/material.dart';
import 'package:flutter_to_do/model/Todo.dart';

class ToDoItems extends StatelessWidget {
  const ToDoItems(
      {super.key,
      required this.todo,
      required this.onTodoChange,
      required this.onDeleteItem});
  final ToDo todo;
  final onTodoChange;
  final onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          // print("tab on ToDos list");
          onTodoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.red),
          child: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              // print("Tab on Dell Button");
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
