import 'bmi.dart';
import 'types.dart';

class BMIController {
 final BMIManager _bmiManager = BMIManager(heightUnit: CENTIMETER,ageUnit: AGEUNIT,weightUnit: KILOGRAM);
 BMIController(){
   this._bmiManager.height = 170;
    this._bmiManager.weight =70;
    this._bmiManager.age =19;
 }
 void incrementWeight( ){
   _bmiManager.weight++;
 }
 void decrementWeight(){
   _bmiManager.weight--;
 }
 void incrementAge() {
   _bmiManager.age++;
 }
 void decrementAge(){
   _bmiManager.age--;
 }
 void toggleGender(GenderType gender) {
   _bmiManager.gender = gender ;
 }
 GenderType getSelectedGender() {
   return _bmiManager.gender;
 }
 void setHeight(double height) {
   _bmiManager.height = height;
 }
  double getHeight() {
    return _bmiManager.height;
  }
  
  int getWeight() {
    return _bmiManager.weight;
  }
  
  int getAge() {
    return _bmiManager.age;
  }
 double calculateBmi() {
   return _bmiManager.calculateBmi();
 }
 String heightUnit() {
   return _bmiManager.heightUnit;
 }
 String ageUnit() {
   return _bmiManager.ageUnit;
 }
 String weightUnit() {
   return _bmiManager.weightUnit;
 }
 String getBodyType() {
   return _bmiManager.getBodyType();
 }
String getIndication() {
   return _bmiManager.getIndication();
 }
}