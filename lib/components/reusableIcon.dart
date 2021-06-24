import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ReusableChild extends StatelessWidget {
  final IconData insideIcon;
  final String label;
  ReusableChild({@required this.insideIcon, this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          insideIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLableTextStyle,
        )
      ],
    );
  }
}
