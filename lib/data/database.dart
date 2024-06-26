import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];
  final _myBox = Hive.box('myBox');

  void createInitialData() {
    toDoList = [
      ["Hello! Welcome to my TO DO app", false],
      ["Press the '+' to add a new task", false],
      ["Long press an exisiting task to edit it", false],
      ["Long press the '+' to clear the list! ", false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
