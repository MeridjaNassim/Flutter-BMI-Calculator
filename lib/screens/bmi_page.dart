import 'package:bmi_calculator/widgets/result.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_button.dart';
import '../widgets/reusable_card.dart';
import '../constants/colors.dart';
import '../logic/controllers.dart';

class BmiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
               icon: Icon(Icons.arrow_back_ios, color: Colors.white),
               onPressed: () => Navigator.of(context).pop(),
        ), 
        title: Text('ESTIMATED BMI'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : <Widget>[
          
          SizedBox(height : 60),
          Expanded(
            flex: 5,
            child : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ReusableCard(color: kActiveContainerColor,
              child: Result(
                bmi : controller.calculateBmi().toStringAsFixed(1),
                bodyType :controller.getBodyType(),
                indication :controller.getIndication(),
              ),
              ),
            )
          ),
          SizedBox(height : 16),
          BottomButton(onTap: ()=> Navigator.pop(context),text:'RE-CALCULATE YOUR BMI')
        ]
      ),
    );
  }
}