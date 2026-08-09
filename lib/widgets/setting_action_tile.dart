import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

class SettingActionTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final String buttonText;
  final Color buttonTextColor;
  final Color buttonBgColor;
  final VoidCallback onTap;


  const SettingActionTile({super.key, 
  required this.icon, 
  required this.iconColor, 
  required this.iconBgColor, 
  required this.title, 
  required this.subtitle, 
  required this.buttonText, 
  required this.buttonTextColor, 
  required this.buttonBgColor, 
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
   //final themeProvider=Provider.of<ThemeProvider>(context);
    return Row(
    children: [
      Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: iconBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon,color: iconColor,size: 22,),
      ),
      const SizedBox(width: 14,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color:Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 2,),
              Text(
                subtitle,
                
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color:AppColors.grey3Color,
                ),
              )
          ],
        ),
        ),
        TextButton(
          onPressed: onTap, 
          style: TextButton.styleFrom(
            backgroundColor: buttonBgColor,
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),

          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: buttonTextColor,
            ),
          ))
    ],
    );
  }
}