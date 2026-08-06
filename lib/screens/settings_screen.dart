import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/theme/app_colors.dart';
import 'package:flutter_application_11/widgets/app_bottom_navigation.dart';
import 'package:flutter_application_11/widgets/setting_action_tile.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  BoxDecoration _buildCardDecoration(ThemeProvider themeProvider){
    return BoxDecoration(
      color:themeProvider.isDarkMode
      ?Colors.grey.shade900
      :Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color:themeProvider.isDarkMode
        ? Colors.white10
        :const Color(0xFFE2E8F0),
        width: 1.2

      ),
      boxShadow: [
        if (!themeProvider.isDarkMode)
          BoxShadow(
            color: const Color(0xFF0F172A).withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    final taskProvider=Provider.of<TaskProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      bottomNavigationBar: const AppBottomNavigation(currentIndex: 3),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:const EdgeInsets.only(left: 24,right: 24,top: 24,bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: themeProvider.textColor,
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    'Manage your preferences',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color:AppColors.grey3Color,

                    ),
                  )

                ],
              ),
            ),
            Divider(
              color:themeProvider.isDarkMode
              ?Colors.white10
              :Colors.grey.shade200,
              height: 1,
              thickness: 1.5,
            ),

            Expanded(
              child: SingleChildScrollView(
                padding:  const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: _buildCardDecoration(themeProvider),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'APPEARANCE',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              letterSpacing: 0.8,
                              color: AppColors.grey3Color,
                            ),
                          ),
                          const SizedBox(height: 16,),

                          SettingActionTile(
                           icon:themeProvider.isDarkMode?Icons.dark_mode_outlined:Icons.wb_sunny_outlined ,
                           iconColor: const Color(0xFF64748B), 
                           iconBgColor: const Color(0xFFF1F5F9),
                           title: 'Theme', 
                           subtitle: themeProvider.isDarkMode?'Dark mode':'Light mode', 
                           buttonText: 'Switch', 
                           buttonTextColor: AppColors.purple, 
                           buttonBgColor: AppColors.purple.withOpacity(0.1), 
                           onTap: ()=>themeProvider.toggleTheme()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: _buildCardDecoration(themeProvider),
                      child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          const Text(
                            'BULK ACTIONS',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppColors.grey3Color,
                              letterSpacing: 0.8,
                            ),
                          ),
                          const SizedBox(height: 16,),
                          SettingActionTile(
                            icon: Icons.refresh_rounded, 
                            iconColor: const Color(0xFF10B981),
                            iconBgColor:const Color(0xFFECFDF5),
                            title: 'Mark all complete', 
                            subtitle:' ${taskProvider.remainingTaskCount} tasks remaining', 
                            buttonText: 'Run', 
                            buttonTextColor: const Color(0xFF10B981), 
                            buttonBgColor: const Color(0xFFECFDF5),
                            onTap: (){
                              taskProvider.markAllTasksComplete();
                            }),
                            const Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Divider(color: Color(0xFFF1F5F9), height: 1),
                              ),
                              
                              SettingActionTile(
                                icon: Icons.delete_outline_rounded ,
                                iconColor: const Color(0xFFEF4444),
                                iconBgColor: const Color(0xFFFEF2F2),
                                title: 'Delete completed',
                                subtitle: '${taskProvider.completedTasksCount} tasks will be removed',
                                buttonText: 'Run', 
                                buttonTextColor: const Color(0xFFEF4444),
                                buttonBgColor: const Color(0xFFFEF2F2),
                                onTap:(){
                                  taskProvider.deleteDoneTasks();
                                }
                                )
                         ],
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: _buildCardDecoration(themeProvider),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SUMMARY',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              letterSpacing: 0.8,
                              color:AppColors.grey3Color,
                            ),
                          ),
                          const SizedBox(height: 16,),
                          _buildSummaryRow('Total tasks',
                          '${taskProvider.tasks.length}',
                           themeProvider),
                           const SizedBox(height: 12,),
                           _buildSummaryRow('Completed', '${taskProvider.completedTasksCount}', themeProvider),
                           const SizedBox(height: 12,),
                           _buildSummaryRow('Active', '${taskProvider.remainingTaskCount}', themeProvider),
                           const SizedBox(height: 12,),
                           _buildSummaryRow('Pinned', '${taskProvider.pinnedTasksCount}', themeProvider)
                        ],
                      ),
                    )
                  ],
                ),
              )
              )
          ],
        )
      ),
    );
  }
  Widget _buildSummaryRow(String label,String value,ThemeProvider themeProvider){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFF475569),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: themeProvider.textColor,
          ),
        )
      ],
    );
  }
  
}