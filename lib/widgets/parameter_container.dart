import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';
import '../constants/styles.dart';

const double kFontSizeFactor = 0.8;
class ParameterContainer extends StatelessWidget {
  final String heroTag;
  final String name ;
  final String value;
  final String unit;
  final VoidCallback onPlus ;
  final VoidCallback onMinus ;
  ParameterContainer({@required this.name,@required this.onPlus,@required this.onMinus,this.value,this.unit, @required this.heroTag});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children : <Widget>[
        SizedBox(height : 5),
        Text(this.name , style: kLabelTextStyle.apply(fontSizeFactor : kFontSizeFactor),),
        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children : <Widget>[
                  Text(this.value,style : kNumberTextStyle.apply(fontSizeFactor : kFontSizeFactor )),
                  Text(this.unit,style :kLabelTextStyle.apply(fontSizeFactor : kFontSizeFactor))
                ]
              ),
        Theme(
            data: Theme.of(context).copyWith(
              floatingActionButtonTheme : FloatingActionButtonThemeData(
                backgroundColor : kFloatingButtonColor,
                foregroundColor: Colors.white
              )
            ),  
            child: Row(
            children: <Widget>[
              Expanded(
              child: FloatingActionButton(
                heroTag: this.heroTag+"-",
              child: Icon(Icons.remove,size: 30,),
              onPressed: this.onMinus
                ) 
            ),
             Expanded(
              child: FloatingActionButton(
                heroTag: this.heroTag+"+",
                child: Icon(Icons.add,size: 30),
                onPressed: this.onPlus
              ) 
            ),
            ],
          ),
        ),
        SizedBox(height : 5),
      ],
    );
  }
}