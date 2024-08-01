class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, this.isDone = false, required this.todoText});
  static List<ToDo> todoList() {
    return [
      ToDo(id: "0", todoText: "Morning Exercise", isDone: true),
      ToDo(id: "1", todoText: "Check Mail", isDone: true),
      ToDo(
        id: "2",
        todoText: "Team Meeting",
      ),
      ToDo(id: "3", todoText: "Gaming Time", isDone: true),
      ToDo(
        id: "4",
        todoText: "OutDoor Game",
      ),
      ToDo(
        id: "5",
        todoText: "Study Time",
      ),
      ToDo(
        id: "6",
        todoText: "Dinner",
      ),
      ToDo(
        id: "7",
        todoText: "Result Check",
      ),
      ToDo(
        id: "8",
        todoText: "Night Exercise",
      )
    ];
  }
}
