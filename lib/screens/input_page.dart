import 'package:bmi_calculator/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.dart';
import '../widgets/reusable_card.dart';
import '../constants/styles.dart';
import '../widgets/gender_container.dart';
import '../widgets/parameter_container.dart';
import '../widgets/bottom_button.dart';
import '../logic/controllers.dart';
import '../logic/types.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor ;
  Color femaleCardColor ;
  @override
  void initState() {
    super.initState();
    maleCardColor = kActiveContainerColor;
    femaleCardColor = kInactiveContainerColor;
  }
  void _toggleGender(GenderType gender) {
    if(gender == controller.getSelectedGender()) return ;
    setState(() {
     controller.toggleGender(gender);
    });
  }
  Color _dispatchSelectionColor(GenderType gender) => controller.getSelectedGender() == gender ? kActiveContainerColor : kInactiveContainerColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(color: _dispatchSelectionColor(GenderType.MALE) ,
                  onTap: ()=> _toggleGender(GenderType.MALE),
                    child: GenderContainer(
                    text: "MALE",
                    icon: FontAwesomeIcons.mars,
                      ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(color:_dispatchSelectionColor(GenderType.FEMALE),
                    onTap: ()=>_toggleGender(GenderType.FEMALE),
                    child : GenderContainer(text: "FEMALE", icon: FontAwesomeIcons.venus)
                  ),
                )
              ],
            ),
          ),
          Expanded(child: ReusableCard(color:kActiveContainerColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height :10),
              Text("HEIGHT", style: kLabelTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children : <Widget>[
                  Text(controller.getHeight().toInt().toString(),style : kNumberTextStyle),
                  Text(controller.heightUnit(),style :kLabelTextStyle)
                ]
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: kThumbSliderColor,
                  activeTrackColor: kActiveSliderColor,
                  overlayColor: kOverlaySliderColor,
                  thumbShape : RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape( overlayRadius: 30)
                ),
                child: Slider(value: controller.getHeight(),
                inactiveColor: kInactiveSlideColor,
                min: MIN_HIEGHT,
                max: MAX_HEIGHT, 
                onChanged: (value)=> setState((){
                   controller.setHeight(value);
                })),
              )
            ],
          ),
          )),
          Expanded(
              child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(
                  color:kActiveContainerColor,
                  child: ParameterContainer(name: "WEIGHT", heroTag: "weight",onPlus: (){
                    setState(()=> controller.incrementWeight());
                  }, onMinus:(){
                    setState(() => controller.decrementWeight());
                  }  , value: controller.getWeight().toString(), unit:controller.weightUnit(),),
                  )),
                Expanded(child: ReusableCard(color:kActiveContainerColor,
                child: ParameterContainer(name: "AGE",heroTag: "age" ,onPlus: (){
                  setState(()=> controller.incrementAge());
                }, onMinus:(){
                  setState(()=> controller.decrementAge());
                }, value :controller.getAge().toString() , unit:controller.ageUnit()),
                ))
              ],
            ),
          ),
          BottomButton(onTap: ()=> Navigator.pushNamed(context,bmi_route ) , text: "CALCULATE YOUR BMI",)
         
        ],
      )
    );
  }


}

