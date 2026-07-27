import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/models/task_model.dart';
import 'package:flutter_application_11/core/services/prefs_services.dart';

class TaskProvider  extends ChangeNotifier{
  List<TaskModel>_tasks=[
   
  ];

  final List<String>_categories=['All','Work','Personal','Shopping','Study','Sports','cooking'];
   String _selectedCategory='All';
   List<String> get categories=>_categories;
   String get selectedCategory=>_selectedCategory;

   void selectCategory(String categoryName){
   _selectedCategory=categoryName;
   notifyListeners();
  }
  bool _isDarkMode=false;
  String _currentFilter='All';

  List<TaskModel>get tasks=>_tasks;
  bool get isDarkMode=>_isDarkMode;
  String get currentFilter=>_currentFilter;

  TaskProvider(){
    loadTasksFromStorage();
  }
  
  void loadTasksFromStorage(){
  final dynamic tasksData=PrefsServices.getData(key: 'saved_tasks');

  if(tasksData!=null && tasksData is String){
    final List<dynamic>decodedList=jsonDecode(tasksData);
    _tasks=decodedList.map((item)=>TaskModel.fromJson(item)).toList();
    notifyListeners();
  }
  }

  List<TaskModel> get filteredTasks{
    if(currentFilter=='Active'){
      return _tasks.where((task)=>!task.isDone).toList();
    }else if(currentFilter=='Completed'){
      return _tasks.where((task)=>task.isDone).toList();

    }
    return _tasks;
  }

  void _saveToStorage() {
    final List<Map<String, dynamic>> mappedList = _tasks.map((task) => task.toJson()).toList();
    final String tasksString = jsonEncode(mappedList);
    
    
    PrefsServices.saveData(key: 'saved_tasks', value: tasksString);
  }

  void toggleTheme(){
    _isDarkMode=!_isDarkMode;
    notifyListeners();
  }

  void addTask(String title){
    if(title.trim().isNotEmpty){
      _tasks.add(TaskModel(title: title));
      notifyListeners();
      _saveToStorage();
    }

  }
  void toggleTaskStatus( TaskModel task){
     
     task.toggleDone();
     notifyListeners();
     _saveToStorage();
  }

  void deleteTask(TaskModel task){
     _tasks.remove(task);
     notifyListeners();
     _saveToStorage();
  }
  void clearCompletedTasks(){
    _tasks.removeWhere((task)=>task.isDone);
    notifyListeners();
    _saveToStorage();
  }
  void changeFilter(String newFilter){
    _currentFilter=newFilter;
    notifyListeners();
    _saveToStorage();
  }
} 