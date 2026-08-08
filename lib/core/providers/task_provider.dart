import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/models/task_model.dart';
import 'package:flutter_application_11/core/services/prefs_services.dart';

class TaskProvider  extends ChangeNotifier{
  List<TaskModel>_tasks=[
   
  ];
 
  final List<String>_categories=['All','Work','Personal','Shopping','Study','Sports','Cooking'];
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

  int get activeTasksCount=>_tasks.where((task)=>!task.isDone).length;
  int get doneTasksCount=>_tasks.where((task)=>task.isDone).length;
  int get completedTasksCount=>_tasks.where((task)=>task.isDone).length;
  int get remainingTaskCount=>_tasks.where((task)=>!task.isDone).length;
  int get totalTaskCount=>_tasks.length;
  int get pinnedTasksCount=>_tasks.where((task)=>task.isPinned).length;

 int get dueSoonTasksCount {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  return _tasks.where((task) {
    if (task.isDone) return false;
    
    final targetDate = DateTime(task.dueDate.year, task.dueDate.month, task.dueDate.day);
    final differenceInDays = targetDate.difference(today).inDays;

    
    return differenceInDays >= 0 && differenceInDays <= 3;
  }).length;
}

int getTaskCountByPriority(String priority){
  return _tasks.where((task)=>task.priority.toLowerCase()==priority.toLowerCase()).length;
}

int getTaskCountByCategory(String category) {
  return _tasks.where((task) => task.category.toLowerCase() == category.toLowerCase()).length;
}

  String _searchQuery='';
  String get searchQuery => _searchQuery;

  void updateSearchQuery(String query){
    _searchQuery=query;
    notifyListeners();
  }


  void markAllTasksComplete(){
    for(var task in _tasks){
      task.isDone=true;
    }
    notifyListeners();
  }

  void deleteDoneTasks(){
    _tasks.removeWhere((task)=>task.isDone);
    notifyListeners();
  }

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
   List <TaskModel> temptasks=List.from(_tasks);//another copy of the original list

   if(currentFilter =='Active'){
    temptasks=temptasks.where((task)=>!task.isDone).toList();
  }else if(currentFilter=='Done'){
   temptasks=temptasks.where((task)=>task.isDone).toList();
   }
   if(selectedCategory !='All'&& selectedCategory.isNotEmpty){
    temptasks=temptasks.where((task)=>task.category.trim().toLowerCase()==_selectedCategory.trim().toLowerCase()).toList();

   }
   if(_searchQuery.isNotEmpty){
    temptasks=temptasks.where((task)=>task.title.toLowerCase().contains(_searchQuery.toLowerCase())||
    task.notes.toLowerCase().contains(_searchQuery.toLowerCase())||
    task.category.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

   }
   return temptasks;
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

  // void addTask(String title){
  //   if(title.trim().isNotEmpty){
  //     _tasks.add(TaskModel(title: title, id: '', priority: '', category: '', dueDate: null));
  //     notifyListeners();
  //     _saveToStorage();
  //   }
void addTask({
    required String title,
    String notes = '',
    required String priority,
    required String category,
    required DateTime dueDate,
  }) {
   final newTask=
        TaskModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(), 
          title: title,
          notes: notes,
          priority: priority,
          category: category,
          dueDate: dueDate,
          isDone: false,
        
      );
      _tasks.add(newTask);
      notifyListeners();
      _saveToStorage();
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

  void updateTask({
  required String id,
  required String newTitle,
  required String newNotes,
  required String newPriority,
  required String newCategory,
  required DateTime newDueDate,
  }){
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(
        title: newTitle,
        notes: newNotes,
        priority: newPriority,
        category: newCategory,
        dueDate: newDueDate,
      );
      notifyListeners();
      _saveToStorage();
    }
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

  void togglePinTask(String id){
    final index=_tasks.indexWhere((task)=>task.id==id);
    if(index !=-1){
      _tasks[index] = _tasks[index].copyWith(isPinned: !_tasks[index].isPinned);

      _tasks.sort((a,b){
     if(a.isPinned && !b.isPinned)return -1;
     if(!a.isPinned && b.isPinned)return 1;
     return 0;
      });
      notifyListeners();
      _saveToStorage();
    }
  }
} 