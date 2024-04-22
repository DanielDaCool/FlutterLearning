class Todo{
  String id;
  String todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false
  });

  static List<Todo> todoList() {
    return [
      Todo(id: '0', todoText: "LOL1"),
      Todo(id: '1', todoText: "LOL2"),
      Todo(id: '2', todoText: "LOL3"),
      Todo(id: '3', todoText: "LOL4"),
      Todo(id: '4', todoText: "LOL5"),
      Todo(id: '5', todoText: "LOL6"),
    ];
  }

}