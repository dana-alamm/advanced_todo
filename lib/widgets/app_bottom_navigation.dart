import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/theme/app_colors.dart';
import 'package:provider/provider.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({super.key});

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    return Theme(
      data:Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      child: BottomNavigationBar(
      
         
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex=index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: themeProvider.backgroundColor,
        selectedItemColor: AppColors.purple,
        unselectedItemColor: themeProvider.textColor.withOpacity(0.4),
        elevation: 0,
        
        items:  [
          BottomNavigationBarItem(
            icon: _selectedIndex==0
            ? Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            decoration: BoxDecoration(
              color:AppColors.purple.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color:  AppColors.purple.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
                
              ]
            ),
            child: const Icon(Icons.task_alt),
            )
            :const Icon(Icons.task_alt),
      label: 'Tasks',
            ),
           
           BottomNavigationBarItem(
            icon: _selectedIndex==1
            ?Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            decoration: BoxDecoration(
              color:AppColors.purple.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color:  AppColors.purple.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.search),
            )
            : const Icon(Icons.search),
            label: 'Search',
            ),
            BottomNavigationBarItem(
               icon: _selectedIndex==2
            ?Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            decoration: BoxDecoration(
              color:AppColors.purple.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color:  AppColors.purple.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child:  Icon(Icons.bar_chart_outlined),
            )
            : const Icon(Icons.bar_chart_rounded),
              label:'Stats',
             
      
              ),
            
            BottomNavigationBarItem(
               icon: _selectedIndex==3
            ?Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            decoration: BoxDecoration(
              color:AppColors.purple.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color:  AppColors.purple.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child:  Icon(Icons.settings_outlined),
            )
            : const Icon(Icons.settings_outlined),
              label:'More',
             
      
              
                ),
        ]
        ),
    );
  }
}