import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/utility/dialog_box.dart';
import 'package:to_do/utility/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(int index, bool? value) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.pop(context);
      db.updateData();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () {
            Navigator.pop(context);
            _controller.clear();
          },
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[300],
        appBar: AppBar(
          title: const Center(
            child: Text(
              "TO DO",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.deepPurple,
          toolbarHeight: 75,
        ),
        floatingActionButton: GestureDetector(
          onLongPress: () {
            setState(() {
              db.toDoList.clear();
            });
          },
          child: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            onPressed: () {
              return createNewTask();
            },
            child: const Icon(
              CupertinoIcons.add,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(index, value),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
