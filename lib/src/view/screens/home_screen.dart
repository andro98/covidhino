import 'package:covidhino/src/view/widgets/bottom_curved_container.dart';
import 'package:covidhino/src/view/widgets/home_screens/need_test_container.dart';
import 'package:covidhino/src/view/widgets/home_screens/preventions.dart';
import 'package:covidhino/src/view/widgets/home_screens/top_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BottomCurvedContainer(
            size.height * 0.40,
            Color(0xff503CAA),
            20.0,
            TopContainer(size: size),
          ),
          Preventions(size:size),
          NeedTestContainer(size: size),
        ],
      ),
    );
  }


}
