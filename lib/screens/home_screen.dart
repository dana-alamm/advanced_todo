

 import 'package:flutter/material.dart';
 import 'package:flutter_application_11/core/providers/task_provider.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
 import 'package:flutter_application_11/core/theme/app_colors.dart';
import 'package:flutter_application_11/widgets/app_bottom_navigation.dart';
import 'package:flutter_application_11/widgets/category_tabs.dart';
 import 'package:flutter_application_11/widgets/filter_tabs.dart';
import 'package:flutter_application_11/widgets/new_task_bottom_sheet.dart';
import 'package:flutter_application_11/widgets/task_popup_menu.dart';
 import 'package:flutter_application_11/widgets/todo_tile.dart';
import 'package:intl/intl.dart';
 import 'package:provider/provider.dart';


import '../core/providers/theme_provider.dart' show ThemeProvider;

 class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});
   @override
   State<HomeScreen> createState() => _HomeScreenState();
 }

 class _HomeScreenState extends State<HomeScreen> {
  
  @override
   Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    final activeCount=Provider.of<TaskProvider>(context).activeTasksCount;
    return Scaffold(
      backgroundColor:themeProvider.backgroundColor,
     bottomNavigationBar: const AppBottomNavigation(currentIndex: 0,),
     body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Tasks',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: themeProvider.textColor,
                     

                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    //'Sun,Jul 19',
                    DateFormat('EEE,MMM d').format(DateTime.now()),
                    style: TextStyle(
                      color:AppColors.grey3Color,
                      fontFamily: 'Inter',
                      fontSize: 19,
                     
                    ),
                  ),
                ],
               ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:themeProvider.isDarkMode
                        ?Colors.white.withOpacity(0.1)
                        :Colors.grey.withOpacity(0.15),
                        shape: BoxShape.circle
                      ),
                      child: GestureDetector(
                        onTap: ()=>themeProvider.toggleTheme(),
                          
                        
                        child: Icon(Icons.wb_sunny_outlined,
                        color: themeProvider.textColor,
                         ),
                        
                      )
                      ),
                      SizedBox(width: 10,),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: themeProvider.isDarkMode
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.05),
                        shape: BoxShape.circle
                      ),
                      // child: GestureDetector(
                      //   onTap: () {
                         
                      //   },
                      //   child: Icon(Icons.playlist_add_check,
                      //   color: themeProvider.textColor),
                      // ),
                      child: const TaskPopupMenu(),
                    )
                  ],
                )
              ],
            ),
            
          ),
          const FilterTabs(),
          const CategoryTabs(),

   

          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Active . $activeCount',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: themeProvider.isDarkMode
                  ? Colors.white
                  :Color(0xff52525C),
                ),
              ),
            ),
            ),

          SizedBox(height: 12,),
          
          Expanded(
            child: Consumer<TaskProvider>(
              builder: (context,taskProvider,child){
                if(taskProvider.filteredTasks.isEmpty){
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.assignment_turned_in_outlined,size:64,
                        color:Colors.grey.shade400),
                        const SizedBox(height: 16,),
                        Text(
                          'No tasks found!',
                          style:TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color:themeProvider.textColor.withOpacity(0.6),
                          )
                        )
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding:  const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: taskProvider.filteredTasks.length,
                  itemBuilder: (context,index){
                    final task=taskProvider.filteredTasks[index];

                    return TodoTile(
                      key:ValueKey(task.id),// for no problems in animation
                      task: task,
                     onStateChanged: ()=>taskProvider.toggleTaskStatus(task), 
                      onPinToggled: ()=>taskProvider.togglePinTask(task.id), onEdit: () {  },
                     
                    // onDelete: ()=>taskProvider.deleteTask(task),

                    onDelete: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),

                            ),
                              title:const Text(
                                'Confirm Delete',
                                style: TextStyle(fontWeight: FontWeight.bold),

                              ),
                              content: Text('Are you sure you want to delete "${task.title}"?'),
                              actions: [
                                TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  }, 
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                    color:Colors.grey
                                  ),
                                  ),
                                  
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      taskProvider.deleteTask(task);
                                      Navigator.of(context).pop();
                                    },
                                     child: const Text(
                                      'Delete',
                                      style:TextStyle(
                                        color: Colors.red, 
                                        fontWeight: FontWeight.bold
                                      )
                                     ))
                              ],
                          );
                        }
                        );
                    },
                     // onEdit: ()=>taskProvider.updateTask(id: '', newTitle: '', newNotes: , newPriority: newPriority, newCategory: newCategory, newDueDate: newDueDate)
                    
                     );
                  }
                  );
              }
              )
            ),
        
        ],
       
       
      ),
    
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            //backgroundColor: Colors.transparent,
             builder: (context)=>const NewTaskBottomSheet());
        },
        backgroundColor: AppColors.purple,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        elevation: 4,
        hoverElevation: 6,
        child: Icon(
          Icons.add,
          size:28,
        ),
        ),
    );
   }
 }