import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusableCard.dart';
import 'package:flutter/material.dart';
import '../calculator_brain.dart';
import '../constants.dart';
import 'input.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {@required this.bmiResult,
      @required this.stateResult,
      @required this.description});
  final String bmiResult;
  final String stateResult;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveBoxColor,
              insideCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    stateResult,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult.toString(),
                    style: kBMITextStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      description,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: Text(
              'RE-CALCULATE',
              style: kCalcTextStyle,
            ),
          ))
        ],
      ),
    );
  }
}
