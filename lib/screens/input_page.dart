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


class InputPage extends StatelessWidget {

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
              child: GenderRow()
          ),
          Expanded(
          child: Height()
          ),
          Expanded(
              child: Row(
              children: <Widget>[
                Expanded(child:Parameter(parameterName: "weight",
                onPlus: ()=>controller.incrementWeight(),
                onMinus: ()=> controller.decrementWeight(),
                valueGetter: ()=> controller.getWeight(),
                unitGetter: ()=>controller.weightUnit(),
                ),),
                Expanded(child: Parameter(parameterName: "age",
                onPlus: ()=>controller.incrementAge(),
                onMinus: ()=> controller.decrementAge(),
                valueGetter: ()=> controller.getAge(),
                unitGetter: ()=>controller.ageUnit(),
                ),),
              ],
            ),
          ),
          BottomButton(onTap: ()=> Navigator.pushNamed(context,bmi_route ) , text: "CALCULATE YOUR BMI",)
         
        ],
      )
    );
  }


}


class Parameter extends StatefulWidget {
  Parameter({Key key ,@required this.parameterName,this.onMinus,this.onPlus,this.valueGetter,this.unitGetter}) : super(key: key);
  final String parameterName ;
  final Function onPlus;
  final Function onMinus;
  final Function valueGetter;
  final Function unitGetter ;
  @override
  _ParameterState createState() => _ParameterState();
}

class _ParameterState extends State<Parameter> {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
                  color:kActiveContainerColor,
                  child: ParameterContainer(name: widget.parameterName.toUpperCase(), heroTag: widget.parameterName.toLowerCase(),onPlus: (){
                    setState(widget.onPlus);
                  }, onMinus:(){
                    setState(widget.onMinus);
                  }  , value: widget.valueGetter().toString(), unit:widget.unitGetter(),),
      );
  }
}

class Height extends StatefulWidget {
  Height({Key key}) : super(key: key);

  @override
  _HeightState createState() => _HeightState();
}

class _HeightState extends State<Height> {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
          color:kActiveContainerColor,
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
        );
  }
}

class GenderRow extends StatefulWidget {
  GenderRow({Key key}) : super(key: key);

  @override
  _GenderRowState createState() => _GenderRowState();
}

class _GenderRowState extends State<GenderRow> {
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
    return Row(
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
            );
  }
}