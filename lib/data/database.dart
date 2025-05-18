import 'package:hive_flutter/hive_flutter.dart';

class TasksDatabase{
List toDolist=[];

  //the box
  final _mybox= Hive.box('mybox');


  //first time opening the app
  void createInitialData(){
    toDolist = [
      ['Make a video', false],
      ['Exercise', false],
      ['Code ', false],

    ];
  }


  //load data from database
  void loadData(){
    toDolist = _mybox.get('TODOLIST');
  }

  //update the database
  void updateDatabase(){
    _mybox.put('TODOLIST', toDolist);
  }

}