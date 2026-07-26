import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';

class TodoTile extends StatelessWidget {
  final dynamic task;
  final int index;
  final TaskProvider taskProvider;
  


  const TodoTile({
    super.key,
    required this.task,
    required this.index,
    required this.taskProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
                          //key: ObjectKey(task),
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child:Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //final originalIndex=taskProvider.tasks.indexOf(task);
                                  taskProvider.toggleTaskStatus(task);
                                
                                },
                              
                              child:Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: task.isDone
                                  ?const LinearGradient(
                                    colors:[
                                      Color(0xff8A46E5), 
                                      Color(0xff52A4F9),
                                    ],
                                    begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )
                                    :null,
                                    border: task.isDone?
                                    null:Border.all(
                                   color: Colors.grey[400]!, 
                                   width: 2,
            ),
                                ),
                                child: task.isDone
                                ? const Icon(
                                  Icons.check,
                                  color:Colors.white,
                                  size:18,
                                )
                                :null,
                              ),
                              ),
                              SizedBox(width: 12,),
                              
                               Expanded(
                                child: Text(
                                  task.title,
                                style:TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  decoration: task.isDone
                                  ?TextDecoration.lineThrough
                                  :TextDecoration.none,
                                  decorationColor: taskProvider.isDarkMode ? Colors.white : Colors.black,
                                  decorationThickness: 2.0,
                                  color:taskProvider.isDarkMode ? Colors.white : Colors.black,
                                 
                                ),),
                              
                                ),
                                  GestureDetector(
                                    onTap: () {
                                      //final originalIndex=taskProvider.tasks.indexOf(task);
                                      taskProvider.deleteTask(task);
                                      
                                    },
                                    child: Icon(
                                    Icons.close,
                                    color: Colors.grey[400],
                                     size: 20,
                                       ),
                                  ),
                            ],
                          ),
                          
                          );

  }
}