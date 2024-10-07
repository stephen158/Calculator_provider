import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier {
  String _display = '0';
  double _firstNumber = 0;
  double _secondNumber = 0;
  String _operation = '';

  String get display => _display;

  void inputNumber(String number) {
    if (_display == '0') {
      _display = number;
    } else {
      _display += number;
    }
    notifyListeners();
  }

  void inputOperation(String operation) {
    _firstNumber = double.parse(_display);
    _operation = operation;
    _display = '0';
    notifyListeners();
  }

  void calculate() {
    _secondNumber = double.parse(_display);
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
