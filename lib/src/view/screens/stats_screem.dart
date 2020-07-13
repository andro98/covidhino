import 'package:covidhino/src/view/widgets/bottom_curved_container.dart';
import 'package:covidhino/src/view/widgets/stats_screen/stats_top_container.dart';
import 'package:covidhino/src/view_model/covid_provider/covid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BottomCurvedContainer(
            size.height * 0.55,
            Color(0xff503CAA),
            20.0,
            StatsTopContainer(),
          ),
          Center(
            child: Text(Provider.of<CovidProvider>(context).isWorldCases
                ? 'World'
                : 'MyCountry'),
          ),
        ],
      ),
    );
  }
}
