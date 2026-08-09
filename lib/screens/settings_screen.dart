import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';

import 'package:flutter_application_11/core/theme/app_theme.dart';
import 'package:flutter_application_11/widgets/app_bottom_navigation.dart';
import 'package:flutter_application_11/widgets/setting_action_tile.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  BoxDecoration _buildCardDecoration(BuildContext context,bool isDarkMode){
    return BoxDecoration(
      color: Theme.of(context).cardColor,
     
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
       color: isDarkMode ? Colors.white10 : const Color(0xFFE2E8F0),
        width: 1.2

      ),
      boxShadow: [
        if (!isDarkMode)
          BoxShadow(
           color: const Color(0xFF0F172A).withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
   // final themeProvider=Provider.of<ThemeProvider>(context);
   final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final taskProvider = Provider.of<TaskProvider>(context);
   
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                      color: theme.colorScheme.onSurface,
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
           color: isDarkMode ? Colors.white10 : Colors.grey.shade200,
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
                      decoration: _buildCardDecoration(context,isDarkMode),
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
                          icon: isDarkMode ? Icons.dark_mode_outlined : Icons.wb_sunny_outlined,
                           iconColor: const Color(0xFF64748B), 
                           iconBgColor: const Color(0xFFF1F5F9),
                           title: 'Theme', 
                          subtitle: isDarkMode ? 'Dark mode' : 'Light mode', 
                           buttonText: 'Switch', 
                           buttonTextColor: AppColors.purple, 
                           buttonBgColor: AppColors.purple.withOpacity(0.1), 
                           onTap: (){
                            Provider.of(context,listen: false).toggleTheme();
                           }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      padding: EdgeInsets.all(20),
                     decoration: _buildCardDecoration(context, isDarkMode),
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
                     decoration: _buildCardDecoration(context, isDarkMode),
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
                          _buildSummaryRow(context,
                          'Total tasks',
                          '${taskProvider.tasks.length}'
                           ),
                           const SizedBox(height: 12,),
                           _buildSummaryRow(context,'Completed', '${taskProvider.completedTasksCount}'),
                           const SizedBox(height: 12,),
                           _buildSummaryRow(context,'Active', '${taskProvider.remainingTaskCount}'),
                           const SizedBox(height: 12,),
                           _buildSummaryRow(context,'Pinned', '${taskProvider.pinnedTasksCount}')
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
  Widget _buildSummaryRow(BuildContext context, label,String value){
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
           color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
          ),
        )
      ],
    );
  }
  
}