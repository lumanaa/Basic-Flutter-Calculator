import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Buttons extends ChangeNotifier {
  final List<String> buttons = [
    'AC',
    'D',
    '%',
    '\u00F7',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  var userQuestion = '';
  var userAnswer = '';

  void buttonTapped(int index) {
    userQuestion += buttons[index];
    notifyListeners();
  }

  void btnClear(int index) {
    userQuestion = '';
    userAnswer = '';
    notifyListeners();
  }

  void btnDel(int index) {
    userQuestion = userQuestion.substring(0, userQuestion.length - 1);
    notifyListeners();
  }

  void equalPressed() {
    Parser p = Parser();
    String finalString = userQuestion;
    finalString = userQuestion.replaceAll('x', '*');
    Expression exp = p.parse(finalString);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
    notifyListeners();
  }
}
