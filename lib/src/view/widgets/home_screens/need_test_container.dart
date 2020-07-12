
import 'package:flutter/material.dart';

class NeedTestContainer extends StatelessWidget {
  const NeedTestContainer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: size.height * 0.50,
        width: size.width * 0.90,
        decoration: BoxDecoration(
          color: Color(0xffFFB306),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 8.0),
                      child: Text(
                        'Need to test Covid-19',
                        style: TextStyle(
                          color: Color(0xff3B3858),
                          fontSize: 30.0,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 8.0),
                      child: Text(
                        'There are laboratory tests that can identify the virus that causes COVID-19 in respiratory specimens.',
                        style: TextStyle(
                          color: Color(0xff3B3858),
                          fontSize: 20.0 ,
                          fontFamily: 'NotoSans',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 8.0),
                      child: FlatButton(
                        color: Color(0xff503CAA),
                        child: Text(
                          'Test Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0 ,
                            fontFamily: 'NotoSans',
                          ),
                        ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/img/Group 104.png',
                height: size.height * 0.35,
                width: size.width * 0.25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
