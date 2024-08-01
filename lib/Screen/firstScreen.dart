import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_to_do/Widget/todoitem.dart';
import 'package:flutter_to_do/model/Todo.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final todolist = ToDo.todoList();
  void _handleToDoChange(ToDo todo) {
    setState(() {});
    todo.isDone = !todo.isDone;
  }

  void _deleteToDoChange(String id) {
    setState(() {});
    todolist.removeWhere((item) => item.id == id);
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todolist.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
      _toDoController.clear();
    });
  }

  List<ToDo> _foundToDo = [];
  @override
  void initState() {
    _foundToDo = todolist;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> result = [];
    if (enteredKeyword.isEmpty) {
      result = todolist;
    } else {
      result = todolist
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = result;
    });
  }

  final _toDoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.grey.shade400,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/images/first.jpg"),
                // child: Image.asset("assets/images/first.jpg"),
              )
            ],
          ),
        ),
        body: Stack(children: [
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      onChanged: (value) => _runFilter(value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            child: Text(
                              "All ToDos",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        for (ToDo todo in _foundToDo)
                          ToDoItems(
                            onTodoChange: _handleToDoChange,
                            onDeleteItem: _deleteToDoChange,
                            todo: todo,
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 15, right: 20, bottom: 50),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                            spreadRadius: 0)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _toDoController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add New ToDo Items"),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 50, right: 15),
                  child: ElevatedButton(
                      onPressed: () {
                        _addToDoItem(_toDoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: Size(60, 60),
                          elevation: 10),
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                )
              ],
            ),
          )
        ]));
  }
}
