import 'dart:math';

class BMIBrain {
  final int height;
  final int weight;
  late double result;

  BMIBrain(this.height, this.weight,);

  double calculateBMI() {
    result = weight/pow(height/100,2);
    return result;
  }
  String checkBMIResult(){
    if (result >= 25) {
      return 'Over Weight';
    } if (result >= 18.5) {
      return 'Normal';

    } return 'Under Weight';
  }

  String bmiInterpretations(){
    if (result >= 25) {
      return 'You have a higher than normal body weight.\n Try to exercise more.';
    } if (result >= 18.5) {
      return 'You have a normal body weight.\n Good Job!';

    } return 'You have a lower than normal body weight.\n You can eat a bit more.';
  }
}