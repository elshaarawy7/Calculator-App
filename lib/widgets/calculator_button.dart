// calculator_button.dart
// هذا الملف يحتوي على تعريف أزرار الآلة الحاسبة

import 'package:flutter/material.dart';

// تعريف أنواع الأزرار المختلفة
enum ButtonType {
  number,     // أزرار الأرقام
  operator,   // أزرار العمليات الحسابية
  function,   // أزرار الوظائف الخاصة
  equals,     // زر المساواة
  clear       // زر المسح
}

class CalculatorButton extends StatelessWidget {
  final String text;           // النص المعروض على الزر
  final ButtonType type;       // نوع الزر
  final VoidCallback onPressed; // الدالة التي سيتم تنفيذها عند الضغط على الزر
  final double width;          // عرض الزر
  final double height;         // ارتفاع الزر

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.type,
    required this.onPressed,
    this.width = 80,
    this.height = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // تحديد ألوان الزر بناءً على نوعه والسمة الحالية
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    // تحديد لون الخلفية بناءً على نوع الزر
    Color backgroundColor;
    Color textColor;
    
    switch (type) {
      case ButtonType.number:
        backgroundColor = isDark 
            ? theme.colorScheme.secondary 
            : theme.colorScheme.secondary;
        textColor = theme.textTheme.bodyLarge!.color!;
        break;
      case ButtonType.operator:
        backgroundColor = theme.primaryColor;
        textColor = isDark ? Colors.black : Colors.black;
        break;
      case ButtonType.function:
        backgroundColor = isDark 
            ? const Color(0xFF1E1E1E) 
            : const Color(0xFFBBBBBB);
        textColor = theme.textTheme.bodyLarge!.color!;
        break;
      case ButtonType.equals:
        backgroundColor = theme.primaryColor;
        textColor = isDark ? Colors.black : Colors.black;
        break;
      case ButtonType.clear:
        backgroundColor = isDark 
            ? const Color(0xFF1E1E1E) 
            : const Color(0xFFBBBBBB);
        textColor = theme.textTheme.bodyLarge!.color!;
        break;
    }

    // إنشاء زر مخصص بالشكل المطلوب
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(4),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
