import 'package:covidhino/src/view/widgets/bottom_curved_container.dart';
import 'package:covidhino/src/view/widgets/prevention_icon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              BottomCurvedContainer(
                  size.height * 0.40, Color(0xff503CAA), 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Text(
                          'Covid-19',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                        child: Text(
                          'Symptoms',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                        child: Text(
                          'People may be sick with\nthe virus for 1 to 14 days\nbefore developing symptoms',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontFamily: 'NotoSans',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/img/symptoms.png',
                    height: size.height * 0.25,
                    width: size.width * 0.25,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20.0),
            child: Text(
              'Prevention',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: size.height * 0.50,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,),
              itemBuilder: (context, i) {
                return preventions[i];
              },
              itemCount: preventions.length,
            ),
          ),
          Center(
            child: Container(
              height: size.height * 0.20,
              width: size.width * 0.80,
              color: Color(0xffFFB306),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> preventions = [
    PreventionIcon(
      subtitle: 'Stay at home',
      iconPath: 'assets/img/Group 75.png',
    ),
    PreventionIcon(
      subtitle: 'Keep a safe\ndistance',
      iconPath: 'assets/img/Group 76.png',
    ),
    PreventionIcon(
      subtitle: 'Wash hands often',
      iconPath: 'assets/img/Group 77.png',
    ),
    PreventionIcon(
      subtitle: 'Cover coughs\nand sneezes',
      iconPath: 'assets/img/Group 63.png',
    ),
    PreventionIcon(
      subtitle: 'Wear facemask\nif you are sick',
      iconPath: 'assets/img/Group 79.png',
    ),
    PreventionIcon(
      subtitle: 'Clean and\ndisinfect',
      iconPath: 'assets/img/Group 78.png',
    ),
  ];
}
