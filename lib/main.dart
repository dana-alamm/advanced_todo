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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}

