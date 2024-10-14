import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier {
  String _display = '0';
  double _firstNumber = 0;
  double _secondNumber = 0;
  String _operation = '';

  String get display => _display;

  void inputNumber(String number) {
    if (_display == '0' || ['+', '-', '*', '/'].contains(_display)) {
      _display = number;
    } else {
      _display += number;
    }
    notifyListeners();
  }

  void inputOperation(String operation) {
    _firstNumber = double.parse(_display);
    _operation = operation;
    _display += _operation;
    notifyListeners();
  }

  void calculate() {
    String display = _display;
    if (_operation.isNotEmpty) {
      final parts = display.split(RegExp(r'[+\-*/]'));
      if (parts.length > 1) {
        _secondNumber = double.parse(parts[1]);
      }
    }

    double result;

    switch (_operation) {
      case '+':
        result = _firstNumber + _secondNumber;
        break;
      case '-':
        result = _firstNumber - _secondNumber;
        break;
      case '*':
        result = _firstNumber * _secondNumber;
        break;
      case '/':
        result = _firstNumber / _secondNumber;
        break;
      default:
        result = 0;
    }

    _display = result.toString();
    notifyListeners();
  }

  void clear() {
    _display = '0';
    _firstNumber = 0;
    _secondNumber = 0;
    _operation = '';
    notifyListeners();
  }
}
