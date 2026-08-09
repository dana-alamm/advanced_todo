import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color iconColor;
  final Color badgebgColor;
  const StatCard({
    super.key,
    required this.title,
    required this.count, 
    required this.icon,
    required this.iconColor,
    required this.badgebgColor});

  @override
  Widget build(BuildContext context) {
     //final themeProvider=Provider.of<ThemeProvider>(context);
     final theme=Theme.of(context);
     final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
    color: isDark ? const Color(0xFF1E1E2E) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.white10 : const Color(0xFFE2E8F0),
          width: 1.2,
      ),
          boxShadow: [
           if(!isDark)
             BoxShadow(
            
              color: const Color(0xFF0F172A).withValues(alpha: 0.04),
              blurRadius: 16,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
          decoration: BoxDecoration(
            color:badgebgColor,
            borderRadius: BorderRadius.circular(12),

          ),
          child:Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,size: 16,color:iconColor),
              const SizedBox(width: 6,),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color:iconColor,
                ),
              ),
            ],
          ),
        ),
        Text(
          count,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color:Theme.of(context).colorScheme.onSurface,
          ),
        )
      ],
    ),

    );
  }
}