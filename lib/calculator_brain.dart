import 'package:flutter/material.dart';
import 'dart:math';

class Calculator_BMI_Brain {
  Calculator_BMI_Brain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'you have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'you have a normal body weight. Good job!';
    } else {
      return 'you have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
