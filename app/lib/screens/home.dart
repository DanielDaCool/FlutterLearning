import 'package:app/constants/constants.dart';
import 'package:app/model/todo.dart';
import 'package:app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/todoItem.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = Todo.todoList();
  final _textEditingController = TextEditingController();
  String currentTodo = "";
  List<Todo> _foundTodos = [];

  @override
  void initState() {
    _foundTodos = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: buildAppBar(),
      drawer: Drawer(
        width: 275,
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10.0,
                    offset: Offset(2, 2),
                    color: Colors.black.withOpacity(0.4)),
              ],
            ),
            child: ElevatedButton(
              child: const Text("Login",
                  style: TextStyle(
                  fontSize: 20,
                   color: tdBlue)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Login()));
              },
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                searchBox(),
                _buildTodoList(),
              ],
            ),
          ),
          _buildAddTodo()
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _filter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            color: tdGray,
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(backgroundColor: bgColor, title: const Text("Home screen"));
  }

  Expanded _buildTodoList() {
    return Expanded(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 20),
            child: const Text(
              "All tasks",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          for (Todo todo in _foundTodos)
            toDoItem(
              todo: todo,
              onTodoChanged: _toDoChange,
              onDeleteItem: _deleteTodoItem,
            ),
        ],
      ),
    );
  }

  Align _buildAddTodo() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10,
                    spreadRadius: 0.5,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                onChanged: (value) => currentTodo = value,
                decoration: const InputDecoration(
                  hintText: "Add new task",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                _addTodoItem(currentTodo);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: tdBlue,
                padding: const EdgeInsets.all(13),
                elevation: 10,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 25,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _toDoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String todo) {
    if (todo.isNotEmpty) {
      setState(() {
        todosList.add(Todo(id: todosList.length.toString(), todoText: todo));
      });
    }
    _textEditingController.clear();
  }

  void _filter(String enteredKeyword) {
    List<Todo> results = [];
    // ignore: curly_braces_in_flow_control_structures
    if (enteredKeyword.isEmpty)
      results = todosList;
    else {
      results = todosList
          .where((item) => item.todoText
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundTodos = results;
    });
  }
}
