import '/constants/colorConstants.dart';
import 'package:app/model/todo.dart';
import 'package:flutter/material.dart';

class toDoItem extends StatelessWidget {
  Todo todo;
  final onTodoChanged;
  final onDeleteItem;
   toDoItem({super.key, required this.todo, required this.onDeleteItem, required this.onTodoChanged});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onTodoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: IconButton(
          onPressed: () => todo.isDone = !todo.isDone,
          icon: todo.isDone? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank),
          color: tdBlue,
        ),
        title: Text(
          todo.todoText,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {

              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
      
    );
  }
}
