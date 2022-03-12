import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int? height;
  final int? weight;
  late final bmi;

  String CalculateBMI() {
    bmi = weight! / pow(height! / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return "OverWeight";
    } else if (bmi > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return "you have higher normal than body weight";
    } else if (bmi > 18.5) {
      return "you have normal body weight, good job!";
    } else {
      return "you have a lower than normal body weight";
    }
  }
}
