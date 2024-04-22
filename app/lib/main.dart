import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String name = "";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    name = "";
    return const MaterialApp(
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> todos = [];

  void addToDo(String todo) {
    todos.add("Task: $todo");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ' + (name.isNotEmpty ? name : "Visitor")),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          CupertinoAlertDialog(
            title: const Text("Enter new todo"),
            content: TextField(
              autocorrect: true,
              onSubmitted: (value) => addToDo(value),
            ),
          );
        },
      ),
      drawer: (name.isNotEmpty)
          ? Drawer(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(50),
                child: const Text("You have already entered your name"),
              ),
            )
          : Drawer(
              child: Container(
                margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Enter your name here:"),
                    TextField(
                      autocorrect: true,
                      onSubmitted: (value) {
                        setState(() => name = value);
                      },
                    )
                  ],
                ),
              ),
            ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text((index != 0) ? todos[index] : "no tasks");
        },
      ),
    );
  }
}
