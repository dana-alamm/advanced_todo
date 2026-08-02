import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/widgets/app_bottom_navigation.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
   
  @override
  Widget build(BuildContext context) {
    
    final themeProvider=Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      bottomNavigationBar: const AppBottomNavigation(currentIndex: 1,),
    body: SafeArea(
      child: Column(
     mainAxisAlignment: MainAxisAlignment.start,
     crossAxisAlignment: CrossAxisAlignment.stretch,
     children: [
      Padding(
        padding: const EdgeInsets.only(left: 24,right: 24,top: 24,bottom: 16),
        child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                'Search',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color:themeProvider.textColor
                ),
              ),
              SizedBox(height: 16,),
              TextField(
               style: TextStyle(
                color:themeProvider.textColor,
                fontFamily: 'Inter'
               ),
               decoration: InputDecoration(
                hintText: 'Search tasks...',
                hintStyle: const TextStyle(
                  color:Color(0xff94A3B8),
                  fontFamily: 'Inter',
                  fontSize: 16,

                ),
                fillColor: themeProvider.isDarkMode
                ? Colors.white.withOpacity(0.05)
                :const Color(0xFFF1F5F9),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),

               ),
              ),
              ],
            )
          

        
        ),
        Divider(
          color:themeProvider.isDarkMode 
          
          ?Colors.white10
          : Colors.grey.shade200,
          height: 1,
          thickness: 1.5,
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_rounded,
                  size:80,
                  color:themeProvider.isDarkMode
                  ?Colors.white.withOpacity(0.3)
                  :const Color(0xff94A3B8).withOpacity(0.6),
                ),
                const SizedBox(height: 16,),
                Text(
                  'Type to search your tasks',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color:themeProvider.isDarkMode
                    ?Colors.white.withOpacity(0.4)
                    :const Color(0xff94A3B8),
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
}