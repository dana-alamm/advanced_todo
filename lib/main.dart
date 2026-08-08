import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/services/prefs_services.dart';
import 'package:flutter_application_11/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsServices.init();
  runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>TaskProvider()),
      ChangeNotifierProvider(create: (_)=>ThemeProvider()),
    ],
    child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
   return Consumer<ThemeProvider>( 
      builder: (context, themeProvider, child) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    theme: themeProvider.lightTheme,
    darkTheme: themeProvider.darkTheme,
    themeMode: themeProvider.isDarkMode?ThemeMode.dark:ThemeMode.light,
      home: const HomeScreen(),
    );
  }
    );
  }
}

