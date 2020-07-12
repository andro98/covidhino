import 'package:covidhino/src/view/widgets/home_screens/prevention_icon.dart';
import 'package:flutter/material.dart';

class Preventions extends StatelessWidget {
  Preventions({
    Key key,
    @required this.size,
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
          height: size.height * 0.35,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 1.5),
            itemBuilder: (context, i) {
              return preventions[i];
            },
            itemCount: preventions.length,
          ),
        ),
      ],
    );
  }

  final List<Widget> preventions = [
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
