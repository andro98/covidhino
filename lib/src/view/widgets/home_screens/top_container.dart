
import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Covid-19',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0 ,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                child: Text(
                  'Symptoms',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0 ,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0,bottom: 8.0),
                child: Text(
                  'People may be sick with the virus for 1 to 14 days before developing symptoms',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0 ,
                    fontFamily: 'NotoSans',
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Image.asset(
            'assets/img/Group 105.png',
            height: size.height * 0.25,
            width: size.width * 0.25,
          ),
        ),
      ],
    );
  }
}
