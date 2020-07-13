import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CasesContainer extends StatelessWidget {
  final int numberOfCases;
  final String casesName;
  final Color backgroundColor;
  final Size size;

  CasesContainer(
      {this.numberOfCases, this.casesName, this.backgroundColor, this.size});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: size.height * 0.10,
      width: size.width * 0.40,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              casesName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            child: Text(
              NumberFormat.decimalPattern().format(numberOfCases),
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
