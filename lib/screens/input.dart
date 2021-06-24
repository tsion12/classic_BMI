import 'package:bmi_calculator/screens/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusableIcon.dart';
import '../components/reusableCard.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/rounded_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart ';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColour = kInactiveBoxColor;
  // Color femaleCardColour = kInactiveBoxColor;
  Gender genderType;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    detector: () {
                      setState(() {
                        genderType = Gender.male;
                      });
                    },
                    colour: genderType == Gender.male
                        ? kActiveBoxColor
                        : kInactiveBoxColor,
                    insideCard: ReusableChild(
                        insideIcon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  detector: () {
                    setState(() {
                      genderType = Gender.female;
                    });
                  },
                  colour: genderType == Gender.female
                      ? kActiveBoxColor
                      : kInactiveBoxColor,
                  insideCard: ReusableChild(
                    insideIcon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ))
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kActiveBoxColor,
                insideCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLableTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLableTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29eb1555),
                          thumbColor: Color(0xffeb1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30,
                          )),
                      child: Slider(
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kActiveBoxColor,
                  insideCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLableTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            insertIcon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundedIconButton(
                              insertIcon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveBoxColor,
                  insideCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLableTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            insertIcon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundedIconButton(
                              insertIcon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            )),
            BottomButton(
              onTap: () {
                Calculator_BMI_Brain calc =
                    Calculator_BMI_Brain(height: height, weight: weight);
                calc.calculateBMI();
                calc.getResult();
                calc.getInterpretation();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ResultPage(
                              bmiResult: calc.calculateBMI(),
                              stateResult: calc.getResult(),
                              description: calc.getInterpretation(),
                            )));
              },
              text: Text(
                'CALCULATE',
                style: kCalcTextStyle,
              ),
            ),
          ],
        ));
  }
}
