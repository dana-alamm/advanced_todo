
import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

class FilterTabs extends StatelessWidget {
  
  const FilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeProvider=Provider.of<ThemeProvider>(context);
    final taskProvider=Provider.of<TaskProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color:Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildTabButton(context: context,
           title: 'All', 
           isActive: taskProvider.currentFilter=='All',
            onTap: ()=>taskProvider.changeFilter('All'),
            isDark: isDark
           
             ),

             _buildTabButton(context: context,
              title: 'Active',
               isActive: taskProvider.currentFilter=='Active',
                onTap: ()=>taskProvider.changeFilter('Active'),
                isDark: isDark,
                 ),

                 _buildTabButton(context: context,
                  title: 'Done',
                   isActive:taskProvider.currentFilter=='Done', 

                   onTap: ()=>taskProvider.changeFilter('Done'),
                   isDark: isDark,
                  ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required BuildContext context,
    required String title,
    required bool isActive,
    required VoidCallback onTap,
   // required ThemeProvider themeProvider,//to read the mode
   required bool isDark,


  }){
    return Expanded(
      child: GestureDetector(
        onTap:onTap,
        child:  Container(
          height: 35,
          decoration: BoxDecoration(
            color: isActive
            ?Theme.of(context).colorScheme.surface
            :Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isActive && !isDark
            ? [
              BoxShadow(
                color:Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset:  const Offset(0, 2),
              )
            ]
            : null,
          ),
          child:Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: isActive ?FontWeight.w700:FontWeight.w500,
                color:isActive
                ?AppColors.purple
                :Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          )
        ),

      )
      );
  }
}