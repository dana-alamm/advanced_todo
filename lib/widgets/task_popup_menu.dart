import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/theme/app_theme.dart';

class TaskPopupMenu extends StatefulWidget {
  const TaskPopupMenu({super.key});

  @override
  State<TaskPopupMenu> createState() => _TaskPopupMenuState();
}

class _TaskPopupMenuState extends State<TaskPopupMenu> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
  //  final themeProvider = Provider.of<ThemeProvider>(context);
  final theme=Theme.of(context);
  final isDark=theme.brightness==Brightness.dark;
  final taskProvider=Provider.of<TaskProvider>(context);
  final doneCount=taskProvider.doneTasksCount;

    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: theme.cardColor,
      elevation: 0, 
      offset: const Offset(0, 45),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(), 

      onOpened: () => setState(() => _isMenuOpen = true),
      onCanceled: () => setState(() => _isMenuOpen = false),
      onSelected: (value) {
        setState(() => _isMenuOpen = false);
        final provider = Provider.of<TaskProvider>(context, listen: false);
        if (value == 'complete') {
          provider.markAllTasksComplete();
        } else if (value == 'delete_done') {
          provider.deleteDoneTasks();
        }
      },
      
     
      child: Container(
        width: 40,  
        height: 40, 
        decoration: BoxDecoration(
          shape: BoxShape.circle,
         
          color: _isMenuOpen
              ? AppColors.purple.withOpacity(0.1)
              : (isDark
              ?Colors.white.withValues(alpha: 0.1)
              :Colors.black.withValues(alpha: 0.05)),
          
          
          boxShadow: [
            BoxShadow(
           color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        alignment: Alignment.center, 
        child: Icon(
          Icons.playlist_add_check,
          size: 24, 
          color: _isMenuOpen ? AppColors.purple : Colors.grey.shade600, 
        ),
      ),
      itemBuilder: (BuildContext context) {
        final doneCount = Provider.of<TaskProvider>(context, listen: false).doneTasksCount;
        return [
          PopupMenuItem<String>(
            value: 'complete',
            child: Row(
              children: [
                const Icon(Icons.check_circle_outline, color: Colors.green, size: 20),
                const SizedBox(width: 12),
                Text(
                  'Mark all complete',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color:Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'delete_done',
            child: Row(
              children: [
                const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                const SizedBox(width: 12),
                Text(
                  'Delete done ($doneCount)',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color:doneCount > 0 
    ? Theme.of(context).colorScheme.onSurface 
    : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}