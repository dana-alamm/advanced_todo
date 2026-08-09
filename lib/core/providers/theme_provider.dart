import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_11/core/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider  extends ChangeNotifier{
  bool _isDarkMode=false;
  bool get isDarkMode=>_isDarkMode;

  ThemeProvider(){
    _loadThemeFromPrefs();
  }
  void toggleTheme()async{
    _isDarkMode=!_isDarkMode;
    notifyListeners();
    final prefs=await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }

  void _loadThemeFromPrefs()async{
    final prefs=await SharedPreferences.getInstance();
    final bool? savedTheme=prefs.getBool('isDarkMode');
    if(savedTheme!=null){
      _isDarkMode=savedTheme;
    }else{
      final systemBrightness=PlatformDispatcher.instance.platformBrightness;
      _isDarkMode=(systemBrightness==Brightness.dark);
    }
    notifyListeners();
    
  }

  
  // Color get backgroundColor=>_isDarkMode? AppColors.darkMode:Colors.white;
  // Color get textColor=>_isDarkMode?Colors.white:Colors.black;
  // Color get containerColor => _isDarkMode ? const Color(0xFF1E1E1E) : const Color(0xFFF5F5F5);
}