import 'dart:math';

class Calculator {
  final int height;
  final int weight;
  double bmi = 0.0;

  Calculator({
    required this.height,
    required this.weight,
  });

  String calculate() {
    bmi = weight / (pow(height / 100, 2));
    return bmi.toStringAsFixed(1);
  }

  String getStatus() {
    if (bmi >= 30) {
      return "Obese";
    } else if (bmi >= 25) {
      return "Overweight";
    } else if (bmi >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getExplanation() {
    if (bmi >= 30) {
      return "You are overweight. You can achieve great BMI with a good diet!";
    } else if (bmi >= 25) {
      return "A little more than normal. Don't worry! You can reach the perfect BMI with a small diet.";
    } else if (bmi >= 18.5) {
      return "Good news! Your body mass index is ideal. We wish you a healthy life!";
    } else {
      return "You are a little weaker than usual. How about gaining a little weight with a good nutrition program?";
    }
  }
}
