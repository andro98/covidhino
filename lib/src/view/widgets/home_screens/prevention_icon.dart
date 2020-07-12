import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreventionIcon extends StatelessWidget {
  final String iconPath;
  final String subtitle;

  PreventionIcon({this.iconPath, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage(iconPath),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: Color(0xff3B3858),
            fontSize: 15.0 ,
            fontFamily: 'NotoSans',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
