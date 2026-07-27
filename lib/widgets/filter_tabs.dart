// import 'package:flutter/material.dart';
// import 'package:flutter_application_11/core/providers/task_provider.dart';
// import 'package:flutter_application_11/core/theme/app_colors.dart';

// class FilterTabs extends StatelessWidget {
//   final TaskProvider authProvider;
//   const FilterTabs({super.key, required this.authProvider});

//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 24),
//                     padding: const EdgeInsets.all(8),
//                     height: 68,
//                     width: 360,
//                     decoration: BoxDecoration(
//                       //color:Colors.white,
//                       color: authProvider.isDarkMode ? AppColors.bigDarkBox : Colors.white,
                      
//                     ),
//                     child: Row(
//                       children: [
            
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: ()=> authProvider.changeFilter('All'),
//                             child: Container(
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 color:authProvider.currentFilter=='All'
//                                 ?AppColors.blueColor
//                                 //:AppColors.grey2Color,
//                                 :authProvider.isDarkMode?Colors.black:AppColors.grey2Color,
//                                 borderRadius: BorderRadius.circular(8),
                                
                                        
//                               ),
//                               child: Center(
//                                 child:Text('All',style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 14,
//                                   color: (authProvider.currentFilter=='All'||authProvider.isDarkMode)
//                                   ?Colors.white
//                                   :Colors.black,

//                                   fontWeight: FontWeight.w500,
//                                 ),),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 8,),
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: ()=>authProvider.changeFilter('Active'),
//                             child: Container(
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 color:authProvider.currentFilter=='Active'
//                                 ?AppColors.blueColor
//                                // :AppColors.grey2Color,
//                                 :authProvider.isDarkMode?Colors.black:AppColors.grey2Color,

//                                 borderRadius: BorderRadius.circular(8),
                                        
//                               ),
//                               child: Center(
//                                 child:Text('Active',style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 14,
//                                  color: (authProvider.currentFilter=='Active'||authProvider.isDarkMode)
//                                   ?Colors.white
//                                   :Colors.black,
//                                   fontWeight: FontWeight.w500,
//                                 ),),
//                               ),
//                             ),
//                           ),
//                           ),
//                            SizedBox(width: 8,),
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () => authProvider.changeFilter('Completed'),
//                             child: Container(
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 color:authProvider.currentFilter=='Completed'
//                                 ?AppColors.blueColor
//                                 //:AppColors.grey2Color,
//                                  :authProvider.isDarkMode?Colors.black:AppColors.grey2Color,
//                                 borderRadius: BorderRadius.circular(8),
                                        
//                               ),
//                               child: Center(
//                                 child:Text('Completed',style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   fontSize: 14,
//                                  color: (authProvider.currentFilter=='Completed'||authProvider.isDarkMode)
//                                   ?Colors.white
//                                   :Colors.black,
//                                   fontWeight: FontWeight.w500,
//                                 ),),
//                               ),
//                             ),
//                           ),
//                           )
//                       ],
//                     ),
//     );
//   }
// }
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