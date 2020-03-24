import 'package:flutter/material.dart';
import '../constants/colors.dart';

const bottomContainerHeight = 80.0;


class BottomButton extends StatelessWidget {
  final Function onTap ;
  final String text ;
  BottomButton({@required this.onTap,this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
          child: Material(
            color: kBottomContainerColor ,
            child: InkWell(
              splashColor: kBottomButtonSplashColor,
              onTap: this.onTap,
              child: Center(
              child: Text(this.text, style : TextStyle(
                color : Colors.white,
                fontSize: 18,
                letterSpacing : 3
              )),
              ),
            ),
          ),
          margin: EdgeInsets.only(top : 10),

          width: double.infinity,
          height: bottomContainerHeight,
        
          );
  }
}