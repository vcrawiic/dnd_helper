import 'package:flutter/material.dart';

mixin CalculatorInputMixin<T extends StatefulWidget> on State<T> {
  String inputValue = '';

  int get parsedValue {
    final expression = inputValue.replaceAll(' ', '');
    if (expression.isEmpty) return 0;

    int result = 0;
    String currentNumber = '';
    String operation = '+';

    for (int i = 0; i < expression.length; i++) {
      final char = expression[i];
      if (char == '+' || char == '-') {
        if (currentNumber.isNotEmpty) {
          result = operation == '+'
              ? result + int.parse(currentNumber)
              : result - int.parse(currentNumber);
        }
        operation = char;
        currentNumber = '';
      } else {
        currentNumber += char;
      }
    }
    if (currentNumber.isNotEmpty) {
      result = operation == '+'
          ? result + int.parse(currentNumber)
          : result - int.parse(currentNumber);
    }
    return result;
  }

  void onDigitPressed(String digit) {
    setState(() {
      if ((digit == '+' || digit == '-') &&
          (inputValue.isEmpty ||
              inputValue.endsWith('+') ||
              inputValue.endsWith('-'))) {
        return;
      }
      inputValue += digit;
    });
  }

  void onBackspace() {
    setState(() {
      if (inputValue.isNotEmpty) {
        inputValue = inputValue.substring(0, inputValue.length - 1);
      }
    });
  }

  void clearInput() {
    setState(() => inputValue = '');
  }
}
