import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeProvider=Provider.of<ThemeProvider>(context);
    final taskProvider=Provider.of<TaskProvider>(context);
    return SizedBox(
      height: 40,
     // width: 358,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24),
        itemCount:taskProvider.categories.length ,
        itemBuilder: (context,index){
       final category=taskProvider.categories[index];
       final isActive=taskProvider.selectedCategory==category;

       return Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: ChoiceChip(
          label:Text(category,
          style: TextStyle(
            color: isActive
            ?Colors.white
            :AppColors.textGrey,
            fontWeight: FontWeight.w500,
          ),),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side:BorderSide(
              color:isActive?Colors.transparent:const Color(0xFFE8DFF5),
              width: 1,
            ),
          ),
          
        selectedColor: AppColors.purple,
          selected: isActive,
          showCheckmark: false,
          onSelected: (selected){
          if(selected){
            taskProvider.selectCategory(category);
          }else{
            taskProvider.selectCategory('All');
          }
          },
          ),
        );
        }
        ),
    );
  }
}