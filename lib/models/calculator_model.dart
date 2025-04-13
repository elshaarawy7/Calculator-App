// calculator_model.dart
// هذا الملف يحتوي على نموذج البيانات ومنطق الحساب للآلة الحاسبة

import 'dart:math' as math;

class CalculatorModel {
  // المتغيرات الأساسية لتخزين حالة الآلة الحاسبة
  String _input = '0'; // القيمة المعروضة حالياً
  String _operation = ''; // العملية الحالية (+, -, *, /)
  String _firstOperand = ''; // المعامل الأول في العملية
  String _secondOperand = ''; // المعامل الثاني في العملية
  bool _isNewOperation = true; // هل هذه عملية جديدة؟
  String _expression = ''; // التعبير الكامل (مثل 6000/2+3227*2)
  String _result = ''; // النتيجة النهائية

  // الحصول على القيمة المعروضة حالياً
  String get displayValue => _input;
  
  // الحصول على التعبير الكامل
  String get expression => _expression;
  
  // الحصول على النتيجة
  String get result => _result;

  // إعادة تعيين الآلة الحاسبة
  void clear() {
    _input = '0';
    _operation = '';
    _firstOperand = '';
    _secondOperand = '';
    _isNewOperation = true;
    _expression = '';
    _result = '';
  }

  // إضافة رقم إلى القيمة المعروضة
  void addDigit(String digit) {
    // إذا كانت عملية جديدة، استبدل القيمة الحالية
    if (_isNewOperation) {
      _input = digit;
      _isNewOperation = false;
    } else {
      // إذا كانت القيمة الحالية هي '0'، استبدلها بالرقم الجديد
      // وإلا أضف الرقم إلى القيمة الحالية
      _input = (_input == '0') ? digit : _input + digit;
    }
    
    // إذا كانت هناك عملية حالية، فهذا هو المعامل الثاني
    if (_operation.isNotEmpty) {
      _secondOperand = _input;
      // تحديث التعبير مباشرة عند إدخال المعامل الثاني
      _expression = '$_firstOperand$_operation$_secondOperand';
    } else {
      // إذا لم تكن هناك عملية، فالتعبير هو المدخل الحالي
      _expression = _input;
    }
  }

  // إضافة النقطة العشرية
  void addDecimalPoint() {
    // تحقق مما إذا كانت القيمة الحالية تحتوي بالفعل على نقطة عشرية
    if (!_input.contains('.')) {
      _input += '.';
    }
    
    // إذا كانت عملية جديدة، ابدأ بـ '0.'
    if (_isNewOperation) {
      _input = '0.';
      _isNewOperation = false;
    }
    
    // تحديث التعبير إذا كانت هناك عملية
    if (_operation.isNotEmpty) {
      _secondOperand = _input;
      _expression = '$_firstOperand$_operation$_secondOperand';
    } else {
      _expression = _input;
    }
  }

  // تعيين العملية الحسابية
  void setOperation(String operation) {
    // إذا كان لدينا بالفعل معامل أول وعملية ومعامل ثاني، قم بحساب النتيجة أولاً
    if (_firstOperand.isNotEmpty && _operation.isNotEmpty && _secondOperand.isNotEmpty) {
      calculateResult();
    }
    
    // تخزين المعامل الأول والعملية
    _firstOperand = _input;
    _operation = operation;
    
    // تحديث التعبير ليشمل العملية
    _expression = '$_firstOperand$_operation';
    
    // تعيين العلم للإشارة إلى أننا نبدأ عملية جديدة
    _isNewOperation = true;
  }

  // حساب النتيجة
  void calculateResult() {
    if (_operation.isEmpty) return;
    
    // تحويل المعاملات إلى أرقام
    double first = double.parse(_firstOperand);
    double second = double.parse(_secondOperand.isEmpty ? _input : _secondOperand);
    double resultValue = 0;
    
    // إجراء العملية الحسابية المناسبة
    switch (_operation) {
      case '+':
        resultValue = first + second;
        break;
      case '-':
        resultValue = first - second;
        break;
      case '*':
        resultValue = first * second;
        break;
      case '/':
        // التحقق من القسمة على صفر
        if (second != 0) {
          resultValue = first / second;
        } else {
          _input = 'Error';
          _isNewOperation = true;
          return;
        }
        break;
      case 'sin':
        // تحويل الزاوية من درجات إلى راديان ثم حساب الجيب
        resultValue = double.parse(_input) * (math.pi / 180);
        resultValue = math.sin(resultValue);
        break;
      case 'deg':
        // تحويل الزاوية من راديان إلى درجات
        resultValue = double.parse(_input) * (180 / math.pi);
        break;
    }
    
    // تحديث التعبير الكامل
    _expression = '$_firstOperand$_operation$_secondOperand';
    
    // تنسيق النتيجة (إزالة الأصفار الزائدة بعد النقطة العشرية)
    String resultStr = resultValue.toString();
    if (resultStr.endsWith('.0')) {
      resultStr = resultStr.substring(0, resultStr.length - 2);
    }
    
    // تحديث القيمة المعروضة والنتيجة
    _input = resultStr;
    _result = '=$resultStr';
    
    // إعادة تعيين المتغيرات للعملية التالية
    _firstOperand = resultStr;
    _secondOperand = '';
    _operation = '';
    _isNewOperation = true;
  }

  // تنفيذ عمليات خاصة (مثل sin، deg)
  void executeSpecialOperation(String operation) {
    setOperation(operation);
    calculateResult();
  }
}

