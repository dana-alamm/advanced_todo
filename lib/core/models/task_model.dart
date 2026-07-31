
// // class TaskModel{
// //   String title;
// //   bool isDone;

// //   TaskModel({
// //     required this.title,
// //     this.isDone=false,
// //   });

// //   void toggleDone(){
// //     isDone=!isDone;
// //   }
// //   factory TaskModel.fromJson(Map<String, dynamic> json) {
// //     return TaskModel(
// //       title: json['title'],
// //       isDone: json['isDone'] ?? false, 
// //     );
// //   }
// //   Map<String, dynamic> toJson() {
// //     return {
// //       'title': title,
// //       'isDone': isDone,
// //     };
// //   }
// // }
// class TaskModel {
//   String title;
//   bool isDone;

//   TaskModel({
//     required this.title,
//     this.isDone = false,
//   });

//   void toggleDone() {
//     isDone = !isDone;
//   }

//   factory TaskModel.fromJson(Map<String, dynamic> json) {
//     return TaskModel(
//       title: json['title'],
//       isDone : json['isDone'] ?? false, 
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'isDone': isDone,
//     };
//   }

  
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is TaskModel &&
//           runtimeType == other.runtimeType &&
//           title == other.title &&
//           isDone == other.isDone;

//   @override
//   int get hashCode => title.hashCode ^ isDone.hashCode;
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
class TaskModel {
  final String id;
  final String title;
  final String notes;
  final String priority;
  final String category;
  final DateTime dueDate;
  bool isDone;
  final bool isPinned;
  TaskModel({
 required this.id,
 required this.title,
 this.notes='',
 required this.priority,
 required this.category,
 required this.dueDate,
 this.isDone=false,
  this.isPinned=false,
  });
  

  factory TaskModel.fromJson(Map<String,dynamic>json){
    return TaskModel(
      id: json['id']??'',
      title: json['title']??'',
      notes: json['notes']??'',
      priority: json['priority']??'High',
       category: json['category']??'Personal',
        dueDate: json['dueDate']!=null?DateTime.parse(json['dueDate']):DateTime.now(),
        isDone: json['isDone']??false,
        isPinned: json['isPinnes']??false,
        );
  }
  Map<String,dynamic>toJson(){
    return{
      'id':id,
      'title':title,
      'notes':notes,
      'priority':priority,
      'category':category,
      'dueDate':dueDate.toIso8601String(),
      'isDone':isDone,
      'isPinned':isPinned,
    };
  }
  void toggleDone(){
    isDone=!isDone;
  }

TaskModel copyWith({
    String? id,
    String? title,
    String? notes,
    String? priority,
    String? category,
    DateTime? dueDate,
    bool? isDone,
    bool? isPinned,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      notes: notes ?? this.notes,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
      isPinned: isPinned ?? this.isPinned,
    );
  }
  
  Color get priorityColor{
    if(priority.toLowerCase()=='high')return Colors.red;
    if(priority.toLowerCase()=='medium')return Colors.orange.shade800;
    return Colors.brown;
  }// for string color

  Color get prioritBgColor{
    if(priority.toLowerCase()=='high')return Colors.red.shade50;
    if(priority.toLowerCase()=='medium')return Colors.amber.shade50;
    return Colors.brown.shade50;
  }//background color
Color get priorityBorderColor {
    if (priority.toLowerCase() == 'high') return Colors.red.shade100;
    if (priority.toLowerCase() == 'medium') return Colors.amber.shade200;
    return Colors.green.shade100;
  }//border color

  String get categoryEmoji{
    final Map<String,String> emojiMap={
      'work':'💼',
      'personal':'🏡',
      'shopping':'🛒',
      'study':'📚',
      'sports':'🏀',
      'cooking':'🍳',
    
    };
    return emojiMap[category.toLowerCase()] ?? '🏷️';
  }
}