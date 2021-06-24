import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  @override
  final Color colour;
  final Widget insideCard;
  final Function detector;
  ReusableCard({@required this.colour, this.insideCard, this.detector});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: detector,
      child: Container(
        child: insideCard,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
