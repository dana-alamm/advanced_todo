import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/theme/app_theme.dart';
import 'package:flutter_application_11/screens/home_screen.dart';
import 'package:flutter_application_11/screens/search_screen.dart';
import 'package:flutter_application_11/screens/settings_screen.dart';
import 'package:flutter_application_11/screens/stats_screen.dart';
import 'package:provider/provider.dart';

class AppBottomNavigation extends StatefulWidget {
  final int currentIndex;
 
  const AppBottomNavigation({
    super.key,
   required this.currentIndex,
  });

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  //int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    final currentIdx=widget.currentIndex;
    return Theme(
      data:Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      child: BottomNavigationBar(
      
         
        currentIndex: currentIdx,
        onTap: (index){
         if(index==currentIdx) return;
         
         if(index==0){
          Navigator.pushAndRemoveUntil(
            context,
             MaterialPageRoute(builder: (context)=>const HomeScreen()),
            (Route)=>false);
         }else if(index==1){
          Navigator.pushAndRemoveUntil(
            context,
             MaterialPageRoute(builder: (context)=>const SearchScreen()),
            (Route)=>false);
         }else if(index==2){
          Navigator.pushAndRemoveUntil(context,
           MaterialPageRoute(builder: (context)=>const StatsScreen()),
            (Route)=>false);
         }else if(index==3){
          Navigator.pushAndRemoveUntil(context, 
          MaterialPageRoute(builder: (context)=>const SettingsScreen()), 
          (Route)=>false);
         }
        },

        
        
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedItemColor: AppColors.purple,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
        elevation: 0,
        
        items:  [
          BottomNavigationBarItem(
            icon: currentIdx==0
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
            icon: currentIdx==1
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
               icon: currentIdx==2
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
               icon: currentIdx==3
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