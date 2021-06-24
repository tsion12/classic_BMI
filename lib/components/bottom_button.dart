import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final Text text;
  BottomButton({@required this.onTap, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomBoxColor,
        margin: EdgeInsets.only(top: 10),
        height: kBottomBoxHeight,
        width: double.infinity,
        child: Center(child: text),
      ),
    );
  }
}
