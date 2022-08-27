import 'dart:math';

class BMI_Calculation{
  BMI_Calculation({required this.height,required this.weight});
  final int height;
  final int weight;

  late double _bmi;
  String calculate_BMI(){
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult()
  {
    if(_bmi>=25)
      return 'Overweight';
    else if(_bmi>18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getStatement()
  {
    if(_bmi>=25)
      return 'You have a higher than normal body. Do some exercise';
    else if(_bmi>18.5)
      return 'You have a normal body weight. Good Job';
    else
      return 'You have lower than normal body weight. Eat some Desi ghee Ladoo';
  }
}