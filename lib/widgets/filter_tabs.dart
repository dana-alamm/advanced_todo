
import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/theme/app_colors.dart';
import 'package:provider/provider.dart';

class FilterTabs extends StatelessWidget {
  
  const FilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    final taskProvider=Provider.of<TaskProvider>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode
        ?Colors.white.withValues(alpha: 0.05)
        :Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildTabButton(context: context,
           title: 'All', 
           isActive: taskProvider.currentFilter=='All',
            onTap: ()=>taskProvider.changeFilter('All'),
             themeProvider: themeProvider,
             ),

             _buildTabButton(context: context,
              title: 'Active',
               isActive: taskProvider.currentFilter=='Active',
                onTap: ()=>taskProvider.changeFilter('Active'),
                 themeProvider: themeProvider),

                 _buildTabButton(context: context,
                  title: 'Done',
                   isActive:taskProvider.currentFilter=='Done', 

                   onTap: ()=>taskProvider.changeFilter('Done'),
                    themeProvider: themeProvider),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required BuildContext context,
    required String title,
    required bool isActive,
    required VoidCallback onTap,
    required ThemeProvider themeProvider,//to read the mode


  }){
    return Expanded(
      child: GestureDetector(
        onTap:onTap,
        child:  Container(
          height: 35,
          decoration: BoxDecoration(
            color: isActive
            ?(themeProvider.isDarkMode ?const Color(0xFF2E2E2E):Colors.white)
            :Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isActive && !themeProvider.isDarkMode
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
                :(themeProvider.isDarkMode?Colors.grey:AppColors.textGrey)
              ),
            ),
          )
        ),

      )
      );
  }
}