// main.dart
// هذا هو نقطة الدخول الرئيسية للتطبيق

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/calculator_screen.dart';
import 'themes/app_theme.dart';

void main() {
  // تأكد من تهيئة Flutter قبل تشغيل التطبيق
  WidgetsFlutterBinding.ensureInitialized();
  
  // تعيين اتجاه الشاشة للوضع الرأسي فقط
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  // متغير لتتبع وضع السمة (فاتح/داكن)
  bool _isDarkMode = false;

  // دالة لتبديل وضع السمة
  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // إخفاء شريط التصحيح
      title: 'آلة حاسبة',
      // استخدام السمة المناسبة بناءً على قيمة _isDarkMode
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: CalculatorScreen(
        isDarkMode: _isDarkMode,
        toggleTheme: toggleTheme,
      ),
    );
  }
}
