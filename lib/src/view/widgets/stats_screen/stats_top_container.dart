import 'package:covidhino/src/view/widgets/stats_screen/world_stats_cases_widget.dart';
import 'package:covidhino/src/view/widgets/stats_screen/country_stats_cases_widget.dart';
import 'package:covidhino/src/view_model/covid_provider/covid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class StatsTopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 50.0),
          child: Text(
            'Statistics',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Center(
            child: ToggleSwitch(
                minWidth: size.width * 0.40,
                cornerRadius: 20,
                activeTextColor: Color(0xff7F6FC8),
                inactiveBgColor: Color(0xff7F6FC8),
                inactiveTextColor: Colors.white,
                labels: ['World', 'My Country'],
                initialLabelIndex: Provider.of<CovidProvider>(context).isWorldCases ,
                activeColors: [Colors.white, Colors.white],
                onToggle: (index) {
                  Provider.of<CovidProvider>(context, listen: false)
                      .togggleisWorldCases(index);
                  print('switched to: $index');
                }),
          ),
        ),
        Provider.of<CovidProvider>(context).isWorldCases == 0
            ? WorldStatsCasesWidget(size: size)
            : CountryStatsCasesWidget(size: size),
      ],
    );
  }
}
