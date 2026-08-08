import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/theme/app_colors.dart';
import 'package:flutter_application_11/widgets/app_bottom_navigation.dart';
import 'package:flutter_application_11/widgets/stat_card.dart';
import 'package:provider/provider.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    final taskProvider=Provider.of<TaskProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar:const AppBottomNavigation(currentIndex: 2) ,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
             // Padding(padding: EdgeInsets.all(24),
             Padding( 
                padding: const EdgeInsets.only(left: 24,right: 24,top: 24,bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                     Text(
                'Dashboard',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color:Theme.of(context).textTheme.bodyMedium!.color,
                ),
                
              ),
              SizedBox(height: 6,),
              Text(
                'Your productivity at a glance',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
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
                //color:Theme.of(context).dividerColor,
                height: 1,
                thickness: 1.5,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        // color: themeProvider.isDarkMode
                        // ?Colors.grey.shade900
                        // :Colors.white,
                        color:Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(20),
                        border:Border.all(
                          color: themeProvider.isDarkMode
                          ?Colors.white10
                          :const Color(0xFFE2E8F0),
                          //color:Theme.of(context).dividerColor,
                          width: 1.5,
                        ),
                        boxShadow: [
                          if(!themeProvider.isDarkMode)
                          BoxShadow(
                            color:const Color(0xFF0F172A).withOpacity(0.04),
                            blurRadius: 16,
                            spreadRadius: 0,
                            offset: const Offset(0, 4),
                          )
                        ]

                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 75,
                            width: 75,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: CircularProgressIndicator(
                                    value: taskProvider.tasks.isEmpty
                                    ? 0
                                    :(taskProvider.completedTasksCount/taskProvider.tasks.length),
                                    strokeWidth: 8,
                                    backgroundColor: AppColors.purple.withOpacity(0.15),
                                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.purple),
                                    strokeCap: StrokeCap.round,
                                  ),
                                ),
                                Text(
                                  '${taskProvider.tasks.isEmpty ? 0: ((taskProvider.completedTasksCount/taskProvider.tasks.length)*100).toInt()}%',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).textTheme.bodyMedium!.color,
                                  ),
                                ),
                              
                              ],
                            ),
                           

                          ),
                          const SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Completion rate',
                                style:TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey3Color,
                                ),
                              ),
                              SizedBox(height: 6,),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    color:Theme.of(context).textTheme.bodyMedium!.color,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:'${taskProvider.completedTasksCount} ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:Colors.green,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const TextSpan(
                                  text: 'done',
                                style: TextStyle(
                                  fontSize: 18,
                               fontWeight: FontWeight.w500,
                           color:AppColors.textGrey, 
        ),
      ),
                                    const TextSpan(text: '  ·  '),
                                    TextSpan(
                                      text: '${taskProvider.remainingTaskCount} ',
                                      style:TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:AppColors.purple,
                                        fontSize: 18,
                                      ),
                                    ),
                                
                                    const TextSpan(
                                      text:'remaining',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color:AppColors.textGrey,
                                      ),
                                    ),
                                  ]
                                )
                                ),
                            ],
                          ),
                        
                        ],
                      ),
                    ),
                      const SizedBox(height: 16,),

                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1.4,
                            children: [
                              StatCard(
                                title: 'Total',
                                count: '${taskProvider.tasks.length}',
                                icon: Icons.format_list_bulleted_rounded,
                                iconColor: AppColors.purple, 
                                badgebgColor: AppColors.purple.withOpacity(0.1),
                                ),
                                StatCard(
                                  title: 'Completed',
                                   count: '${taskProvider.completedTasksCount}',
                                    icon: Icons.check_circle_outline_rounded,
                                     iconColor:Colors.green,
                                     badgebgColor: Colors.green.withOpacity(0.1),
                                     ),
                                     StatCard(
                                    title: 'Remaining', 
                                    count: '${taskProvider.remainingTaskCount}', 
                                    icon: Icons.radio_button_unchecked_rounded,
                                    iconColor: Colors.blue, 
                                    badgebgColor: Colors.blue.withOpacity(0.1),
                                    ),
                                    StatCard(
                                      title: 'Pinned', 
                                      count: '${taskProvider.pinnedTasksCount}', 
                                      icon:Icons.star_border_rounded,
                                      iconColor: Colors.orange, 
                                      badgebgColor: Colors.orange.withOpacity(0.1),
                                      ),
                            ],
                            ),
                            const SizedBox(height: 16,),

                            Container(
                               padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: themeProvider.isDarkMode
                        ?Colors.grey.shade900
                        :Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border:Border.all(
                          color: themeProvider.isDarkMode
                          ?Colors.white10
                          :const Color(0xFFE2E8F0),
                          width: 1.5,
                        ),
                        boxShadow: [
                          if(!themeProvider.isDarkMode)
                          BoxShadow(
                            color:const Color(0xFF0F172A).withOpacity(0.04),
                            blurRadius: 16,
                            spreadRadius: 0,
                            offset: const Offset(0, 4),
                          )
                        ]

                      ),
                      child: Column(
                       // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.access_time_rounded,
                              size:16,
                              color:AppColors.grey3Color,
                              ),
                              SizedBox(width: 8,),
                              Text('DUE DATES',
                              style:TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color:AppColors.grey3Color,
                                letterSpacing: 0.8,
                              ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.circle,
                                  size:8,
                                  color:Colors.orange,
                                  ),
                                  const SizedBox(width: 10,),
                                  Text(
                                    'Due soon',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF334155),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                '${taskProvider.dueSoonTasksCount}',
                                style: const TextStyle(
                               fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
            ),
                              )
                            ],
                          ),
                        

                        ],
                      ),
                            ),
                            const SizedBox(height: 16,),

                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color:themeProvider.isDarkMode
                                ? Colors.grey.shade900
                                :Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color:themeProvider.isDarkMode
                                  ?Colors.white10
                                  :const Color(0xFFE2E8F0),
                                  width: 1.2,
                                ),
                                boxShadow: [
                                  if(!themeProvider.isDarkMode)
                                  BoxShadow(
                                    color:const Color(0xFF0F172A).withOpacity(0.04),
                                    blurRadius: 16,
                                    offset: const Offset(0, 4),
                                  )
                                ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.local_fire_department_outlined,size: 16,color: Color(0xFF90A1B9)),
                                      SizedBox(width: 8,),
                                      Text(
                                        'BY PRIORITY',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10,
                                          color: AppColors.grey3Color,
                                          letterSpacing: 0.8
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 16,),

                                  buildPriorityRow(
                                    label: 'High', 
                                    count: taskProvider.getTaskCountByPriority('High'), 
                                    total: taskProvider.tasks.length, 
                                    color: const Color(0xFFFF3B30),
                                    ),
                                    const SizedBox(height: 12,),

                                    buildPriorityRow(
                                      label: 'Medium', 
                                      count: taskProvider.getTaskCountByPriority('Medium'), 
                                      total: taskProvider.tasks.length, 
                                      color: const Color(0xFFFF9500),
                                      ),
                                      const SizedBox(height: 12,),

                                      buildPriorityRow(
                                        label: 'Low', 
                                        count: taskProvider.getTaskCountByPriority('Low'), 
                                        total: taskProvider.tasks.length, 
                                        color: Colors.brown,
                                      
                                        ),

                                ],
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color:themeProvider.isDarkMode
                                ?Colors.grey.shade900
                                :Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color:themeProvider.isDarkMode
                                  ?Colors.white10
                                  :const Color(0xFFE2E8F0),
                                  width: 1.2,
                                ),
                                boxShadow: [

                                  if(!themeProvider.isDarkMode)
                                  BoxShadow(
                                    color:const Color(0xFF0F172A).withOpacity(0.04),
                                    blurRadius: 16,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'BY CATEGORY',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      letterSpacing: 0.8,
                                      color: AppColors.grey3Color,

                                    ),
                                  ),
                                  const SizedBox(height: 16,),

                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                      childAspectRatio: 2.2,
                                      ),
                                      itemCount: taskProvider.categories.where((c)=>c!='All').length, 
                                    itemBuilder: (context,index){
                                      final category=taskProvider.categories.where((c)=>c!='All').toList()[index];
                                      final count=taskProvider.getTaskCountByCategory(category);

                                      return Container(
                                        padding:  const EdgeInsets.symmetric(horizontal: 16,vertical:12),
                                        decoration: BoxDecoration(
                                          color:themeProvider.isDarkMode
                                          ?Colors.grey.shade800 
                                          : const Color(0xFFF8FAFC),
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        child:Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              category,
                                              style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                             color: Theme.of(context).textTheme.bodyMedium!.color,
                                               ),
                                            ),
                                            const SizedBox(height: 2,),
                                            Text(
                                              '$count tasks',
                                              style: const TextStyle(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w500,
                                             color: Color(0xFF90A1B9),
                                          ),
                                            )
                                          ],
                                        )
                                      );
                                    }
                                    )
                                ],
                              ),
                            )
                  ],
                ),
                )
          
             
             ],
          ),
        )
        ),
    );
  }
  Widget buildPriorityRow({
    required String label,
    required int count,
    required int total,
    required Color color,

  }){
    final double progress=total ==0 ? 0:(count /total);
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF475569),
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor:const Color(0xFFF1F5F9),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          ),
          SizedBox(
            width: 35,
            child: Text(
              '$count',
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 14,
                 fontWeight: FontWeight.bold,
                 color: Color(0xFF1E293B),
              ),
            ),
          ),
    
      ],
    );
  }
}