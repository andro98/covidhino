import 'package:flutter/material.dart';

class BottomCurvedContainer extends StatelessWidget {
  final double height;
  final Color color;
  final double curveValue;
  final Widget childWidget;

  BottomCurvedContainer(this.height, this.color, this.curveValue, this.childWidget);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(curveValue),
          bottomRight: Radius.circular(curveValue),
        ),
      ),
      child: childWidget,
    );
  }
}
