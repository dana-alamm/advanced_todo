import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/task_model.dart';

class AuthProvider  extends ChangeNotifier{
  final List<TaskModel>_tasks=[
   
  ];
  bool _isDarkMode=false;
  String _currentFilter='All';

  List<TaskModel>get tasks=>_tasks;
  bool get isDarkMode=>_isDarkMode;
  String get currentFilter=>_currentFilter;
  
  List<TaskModel> get filteredTasks{
    if(currentFilter=='Active'){
      return _tasks.where((task)=>!task.isDone).toList();
    }else if(currentFilter=='Completed'){
      return _tasks.where((task)=>task.isDone).toList();

    }
    return _tasks;
  }

  void toggleTheme(){
    _isDarkMode=!_isDarkMode;
    notifyListeners();
  }

  void addTask(String title){
    if(title.trim().isNotEmpty){
      _tasks.add(TaskModel(title: title));
      notifyListeners();
    }

  }
  void toggleTaskStatus(int index){
     _tasks[index].toggleDone();
     notifyListeners();
  
  }

  void deleteTask(int index){
     _tasks.removeAt(index);
     notifyListeners();
   
  }
  void clearCompletedTasks(){
    _tasks.removeWhere((task)=>task.isDone);
    notifyListeners();
  }
  void changeFilter(String newFilter){
    _currentFilter=newFilter;
    notifyListeners();
  }
} 