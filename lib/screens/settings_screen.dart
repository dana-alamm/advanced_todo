// import 'package:flutter/material.dart';
// import 'package:flutter_application_11/core/providers/task_provider.dart';
// import 'package:flutter_application_11/core/providers/theme_provider.dart';
// import 'package:flutter_application_11/widgets/app_bottom_navigation.dart';
// import 'package:provider/provider.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider=Provider.of<ThemeProvider>(context);
//     final taskProvider=Provider.of<TaskProvider>(context);
//     return Scaffold(
//       backgroundColor: themeProvider.backgroundColor,
//       bottomNavigationBar: const AppBottomNavigation(currentIndex: 3),
//     )
//   }
// }