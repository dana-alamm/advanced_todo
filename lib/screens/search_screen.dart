import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';

import 'package:flutter_application_11/widgets/app_bottom_navigation.dart';
import 'package:flutter_application_11/widgets/todo_tile.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
   
  @override
  Widget build(BuildContext context) {
    
    //final themeProvider=Provider.of<ThemeProvider>(context);
    final theme=Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final taskProvider=Provider.of<TaskProvider>(context);
    final int index;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: const AppBottomNavigation(currentIndex: 1,),
    body: SafeArea(
      child: Column(
     mainAxisAlignment: MainAxisAlignment.start,
     crossAxisAlignment: CrossAxisAlignment.stretch,
     children: [
      Padding(
        padding: const EdgeInsets.only(left: 24,right: 24,top: 24,bottom: 16),
        child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                'Search',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                 color: theme.colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 16,),
              TextField(
                onChanged: (value) {
                  taskProvider.updateSearchQuery(value);
                },
               style: TextStyle(
                color:theme.colorScheme.onSurface,
                fontFamily: 'Inter'
               ),
               decoration: InputDecoration(
                hintText: 'Search tasks...',
                hintStyle: const TextStyle(
                  color:Color(0xff94A3B8),
                  fontFamily: 'Inter',
                  fontSize: 16,

                ),
              fillColor: isDarkMode
                ? Colors.white.withValues(alpha: 0.05)
                : const Color(0xFFF1F5F9),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),

               ),
              ),
              ],
            )
          

        
        ),
     Divider(
              color: isDarkMode
                  ? Colors.white10
                  : Colors.grey.shade200,
              height: 1,
              thickness: 1.5,
            ),
    Expanded(
      child:_buildSearchContent(context, taskProvider, isDarkMode ) ),
     ],
      )
      ),
    );
  }
  Widget _buildSearchContent(
    BuildContext context,
  TaskProvider taskProvider,
  bool isDarkMode ){
    if(taskProvider.searchQuery.isEmpty){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_rounded,
              size: 80,
            color: isDarkMode
    ? Colors.white.withValues(alpha: 0.3)
    : const Color(0xff94A3B8).withValues(alpha: 0.6),
            ),
            const SizedBox(height: 16,),
            Text(
              'Type to search your tasks',
              style: TextStyle(
               
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                 color: isDarkMode 
    ? Colors.white.withValues(alpha: 0.4) 
    : const Color(0xff94A3B8),
              ),
              )
        
          ],
        ),
      );
    }
    if(taskProvider.filteredTasks.isEmpty){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 80,
              color:Colors.grey.shade400,

            ),
            const SizedBox(height: 16,),
            Text(
              'No results found!',
              style:TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              )
            )
          ],
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      itemCount: taskProvider.filteredTasks.length,
      itemBuilder: (context,index){
        final task=taskProvider.filteredTasks[index];
        return TodoTile(
          key:ValueKey(task.id),
          task: task,
          onStateChanged: ()=>taskProvider.toggleTaskStatus(task),
           onDelete: (){}, 
           onEdit: (){},
            onPinToggled:()=>taskProvider.togglePinTask(task.id),
             index: index,);
      });
  }
}