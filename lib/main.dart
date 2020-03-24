import 'package:flutter/material.dart';
import './screens/input_page.dart';
import './screens/bmi_page.dart';
import './constants/routes.dart';
import './constants/colors.dart';
import 'constants/styles.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme : ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor ,
        scaffoldBackgroundColor: kScaffoldColor,
        appBarTheme: kAppBarTheme
      ),
      routes: {
       input_route : (context)=> InputPage(),
       bmi_route : (context)=> BmiPage()
      },
      initialRoute: input_route,
    );
  }
}

