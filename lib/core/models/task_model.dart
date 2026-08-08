

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
  final DateTime createdAt;
  bool isDone;
  final bool isPinned;

  TaskModel({
 required this.id,
 required this.title,
 this.notes='',
 required this.priority,
 required this.category,
 required this.dueDate,
 DateTime?createdAt,
 this.isDone=false,
 this.isPinned=false, 
  }):createdAt=createdAt??DateTime.now();
  

  factory TaskModel.fromJson(Map<String,dynamic>json){
    return TaskModel(
      id: json['id']??'',
      title: json['title']??'',
      notes: json['notes']??'',
      priority: json['priority']??'High',
       category: json['category']??'Personal',

        dueDate: json['dueDate']!=null?DateTime.parse(json['dueDate']):DateTime.now(),
        createdAt: json['createdAt']!=null
        ?DateTime.parse(json['dueDate'])
        :DateTime.now(),

        isDone: json['isDone']??false,
        isPinned: json['isPinned']??false,
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
      'createdAt':createdAt.toIso8601String(),
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
    DateTime?createdAt,
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