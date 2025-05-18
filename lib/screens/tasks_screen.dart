import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sign_up_in_home/data/database.dart';
import 'package:sign_up_in_home/widgets/custom_scaffold.dart';
import 'package:sign_up_in_home/widgets/dialog_box.dart';
import 'package:sign_up_in_home/widgets/todo_tile.dart';

import '../theme/theme.dart';




class TasksScreen extends StatefulWidget{
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  //ref box
    final _mybox= Hive.box('mybox');
  //database
    TasksDatabase db = TasksDatabase();

    @override
  void initState() {
    // first time opening the app
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    }
    //load data
    else {
      db.loadData();
    }
    super.initState();
  }


  //controller
  final _controller = TextEditingController();






  //checkbox tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.updateDatabase();
  }

  //
  //save new task
  void saveNewTask() {
    setState(() {
      db.toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    _controller.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //add task
  void addTask() {
    showDialog(
      context: context,
      builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
      );
  }
  //update task
    void updateTask(int index) {
      _controller.text = db.toDolist[index][0]; // Load current task text

      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: () {
              setState(() {
                db.toDolist[index][0] = _controller.text;
              });
              _controller.clear();
              Navigator.of(context).pop();
            },
            onCancel: () {
              _controller.clear();
              Navigator.of(context).pop();
            },
          );
        },
      );
    }



    //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.updateDatabase();

  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: addTask,
          child: Icon(Icons.add,
          color: Colors.white),
          backgroundColor: lightColorScheme.primary,
          shape: CircleBorder(),
        ),


        body: CustomScaffold(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(height: 10,),
              ),
              Expanded(
                  flex: 20,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)
                        )
                    ),


                    child: ListView.builder(

                        itemCount: db.toDolist.length,
                        itemBuilder: (context, index) {
                          return ToDoTile(
                            taskName: db.toDolist[index][0],
                            taskCompleted: db.toDolist[index][1],
                            onChanged: (value) => checkBoxTapped(value, index),
                            deleteFunction: (context) => deleteTask(index),
                            updateFunction: db.toDolist[index][1] ? null : () => updateTask(index),
                          );
                        }
                    ),

                  )
              )
            ],

          ),
        ),
      );
    }
  }

