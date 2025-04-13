// calculator_screen.dart
// هذا الملف يحتوي على الشاشة الرئيسية للآلة الحاسبة

import 'package:flutter/material.dart';

import '../models/calculator_model.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const CalculatorScreen({
    Key? key,
    required this.isDarkMode,
    required this.toggleTheme,
  }) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // إنشاء نموذج الآلة الحاسبة
  final CalculatorModel _calculator = CalculatorModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // استخدام لون الخلفية من السمة الحالية
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // زر تبديل السمة (فاتح/داكن)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: IconButton(
                  icon: Icon(
                    widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  onPressed: widget.toggleTheme,
                ),
              ),
            ),
            
            // منطقة عرض التعبير والنتيجة
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch, // تغيير من end إلى stretch
                  children: [
                    // عرض التعبير الحسابي
                    Text(
                      _calculator.expression,
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // عرض النتيجة
                    Text(
                      _calculator.result,
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            
            // منطقة الأزرار
            Column(
              children: [
                // الصف الأول: e, μ, sin, deg
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: 'e',
                      type: ButtonType.function,
                      onPressed: () {
                        setState(() {
                          // إضافة قيمة e (2.71828...)
                          _calculator.clear();
                          _calculator.addDigit('2.71828');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: 'μ',
                      type: ButtonType.function,
                      onPressed: () {
                        setState(() {
                          // إضافة قيمة μ (10^-6)
                          _calculator.clear();
                          _calculator.addDigit('0.000001');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: 'sin',
                      type: ButtonType.function,
                      onPressed: () {
                        setState(() {
                          _calculator.executeSpecialOperation('sin');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: 'deg',
                      type: ButtonType.function,
                      onPressed: () {
                        setState(() {
                          _calculator.executeSpecialOperation('deg');
                        });
                      },
                    ),
                  ],
                ),
                
                // الصف الثاني: AC, CE, /, *
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: 'AC',
                      type: ButtonType.clear,
                      onPressed: () {
                        setState(() {
                          _calculator.clear();
                        });
                      },
                    ),
                    CalculatorButton(
                      text: 'CE',
                      type: ButtonType.clear,
                      onPressed: () {
                        setState(() {
                          // مسح الإدخال الحالي فقط
                          _calculator.clear();
                        });
                      },
                    ),
                    CalculatorButton(
                      text: '/',
                      type: ButtonType.operator,
                      onPressed: () {
                        setState(() {
                          _calculator.setOperation('/');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: '*',
                      type: ButtonType.operator,
                      onPressed: () {
                        setState(() {
                          _calculator.setOperation('*');
                        });
                      },
                    ),
                  ],
                ),
                
                // الصف الثالث: 7, 8, 9, -
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '7',
                      type: ButtonType.number,
                      onPressed: () {
                        setState(() {
                          _calculator.addDigit('7');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: '8',
                      type: ButtonType.number,
                      onPressed: () {
                        setState(() {
                          _calculator.addDigit('8');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: '9',
                      type: ButtonType.number,
                      onPressed: () {
                        setState(() {
                          _calculator.addDigit('9');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: '-',
                      type: ButtonType.operator,
                      onPressed: () {
                        setState(() {
                          _calculator.setOperation('-');
                        });
                      },
                    ),
                  ],
                ),
                
                // الصف الرابع: 4, 5, 6, +
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '4',
                      type: ButtonType.number,
                      onPressed: () {
                        setState(() {
                          _calculator.addDigit('4');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: '5',
                      type: ButtonType.number,
                      onPressed: () {
                        setState(() {
                          _calculator.addDigit('5');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: '6',
                      type: ButtonType.number,
                      onPressed: () {
                        setState(() {
                          _calculator.addDigit('6');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: '+',
                      type: ButtonType.operator,
                      onPressed: () {
                        setState(() {
                          _calculator.setOperation('+');
                        });
                      },
                    ),
                  ],
                ),
                
                // الصف الخامس: 1, 2, 3, =
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '1',
                      type: ButtonType.number,
                      onPressed: () {
                        setState(() {
                          _calculator.addDigit('1');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: '2',
                      type: ButtonType.number,
                      onPressed: () {
                        setState(() {
                          _calculator.addDigit('2');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: '3',
                      type: ButtonType.number,
                      onPressed: () {
                        setState(() {
                          _calculator.addDigit('3');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: '=',
                      type: ButtonType.equals,
                      height: 124, // زر أطول يمتد على صفين
                      onPressed: () {
                        setState(() {
                          _calculator.calculateResult();
                        });
                      },
                    ),
                  ],
                ),
                
                // الصف السادس: 0, .
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '0',
                      type: ButtonType.number,
                      width: 124, // زر أعرض
                      onPressed: () {
                        setState(() {
                          _calculator.addDigit('0');
                        });
                      },
                    ),
                    CalculatorButton(
                      text: '.',
                      type: ButtonType.number,
                      onPressed: () {
                        setState(() {
                          _calculator.addDecimalPoint();
                        });
                      },
                    ),
                    // الزر الرابع في هذا الصف هو زر = الذي يمتد على صفين
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}