import 'types.dart';
import 'dart:math';
class BMIManager {
  GenderType _selected ;
  int _height ;
  int _weight;
  int _age;
  String _heightUnit ;
  String _weightUnit ; 
  String _ageUnit ;
  double _lastCalculatedBMI ;   
  BMIManager({ String heightUnit, String weightUnit,String ageUnit}) {
    this._ageUnit = ageUnit;
    this._heightUnit = heightUnit;
    this._weightUnit = weightUnit;
  }

  String get heightUnit => _heightUnit;
  String get weightUnit => _weightUnit;
  String get ageUnit => _ageUnit;

  double get height {
    return this._height.toDouble();
  }


  set height(double newHeight) {
    this._height = newHeight.round();
  }
  int get weight {
    return this._weight;
  }


  set weight(int newWeight) {
    if(newWeight <= 5) this._weight = 5;
    else this._weight = newWeight;
  }
  
  int get age {
    
    return this._age;
  }


  set age(int newAge) {
     if(newAge <= 0) this._age = 0;
    else this._age = newAge;
  }
  
  GenderType get gender {
    return _selected;
  }
  set gender(GenderType gender ) {
    this._selected = gender; 
  }

  double calculateBmi() {
    _lastCalculatedBMI = weight / pow((height.toDouble()/100),2);
    return _lastCalculatedBMI;
  }
  String getBodyType() {
    if(_lastCalculatedBMI> 25) return OVERWEIGHT;
    else if(_lastCalculatedBMI>18.5) return NORMAL;
    else return UNDERWEIGHT;
  }
  String getIndication() {
    return indications[getBodyType()];
  }
  final Map<String,String> indications ={
    OVERWEIGHT : "You have higher than normal body weight , Try to exercice more.",
    NORMAL : "You have a normal body weight , Keep it up",
    UNDERWEIGHT : "You have lower than normal body weight , Eat a bit more"
  };
}