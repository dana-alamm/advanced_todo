import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';
import 'package:flutter_application_11/core/theme/app_colors.dart';

class FilterTabs extends StatelessWidget {
  final TaskProvider authProvider;
  const FilterTabs({super.key, required this.authProvider});

  @override
  Widget build(BuildContext context) {
    return  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(8),
                    height: 68,
                    width: 360,
                    decoration: BoxDecoration(
                      //color:Colors.white,
                      color: authProvider.isDarkMode ? AppColors.bigDarkBox : Colors.white,
                      
                    ),
                    child: Row(
                      children: [
            
                        Expanded(
                          child: GestureDetector(
                            onTap: ()=> authProvider.changeFilter('All'),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color:authProvider.currentFilter=='All'
                                ?AppColors.blueColor
                                //:AppColors.grey2Color,
                                :authProvider.isDarkMode?Colors.black:AppColors.grey2Color,
                                borderRadius: BorderRadius.circular(8),
                                
                                        
                              ),
                              child: Center(
                                child:Text('All',style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: (authProvider.currentFilter=='All'||authProvider.isDarkMode)
                                  ?Colors.white
                                  :Colors.black,

                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Expanded(
                          child: GestureDetector(
                            onTap: ()=>authProvider.changeFilter('Active'),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color:authProvider.currentFilter=='Active'
                                ?AppColors.blueColor
                               // :AppColors.grey2Color,
                                :authProvider.isDarkMode?Colors.black:AppColors.grey2Color,

                                borderRadius: BorderRadius.circular(8),
                                        
                              ),
                              child: Center(
                                child:Text('Active',style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                 color: (authProvider.currentFilter=='Active'||authProvider.isDarkMode)
                                  ?Colors.white
                                  :Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ),
                          ),
                          ),
                           SizedBox(width: 8,),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => authProvider.changeFilter('Completed'),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color:authProvider.currentFilter=='Completed'
                                ?AppColors.blueColor
                                //:AppColors.grey2Color,
                                 :authProvider.isDarkMode?Colors.black:AppColors.grey2Color,
                                borderRadius: BorderRadius.circular(8),
                                        
                              ),
                              child: Center(
                                child:Text('Completed',style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                 color: (authProvider.currentFilter=='Completed'||authProvider.isDarkMode)
                                  ?Colors.white
                                  :Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ),
                          ),
                          )
                      ],
                    ),
    );
  }
}