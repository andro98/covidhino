
import 'package:covidhino/src/model/entities/country_total_entity.dart';
import 'package:covidhino/src/view/widgets/common/loading_widget.dart';
import 'package:covidhino/src/view/widgets/stats_screen/cases_container.dart';
import 'package:covidhino/src/view_model/covid_provider/covid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryStatsCasesWidget extends StatefulWidget {
  const CountryStatsCasesWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _CountryStatsCasesWidgetState createState() => _CountryStatsCasesWidgetState();
}

class _CountryStatsCasesWidgetState extends State<CountryStatsCasesWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<CovidProvider>(context, listen: false).getCountryTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer <CovidProvider>(
        builder: (context, model, child) {
          switch (model.allCountryStatus) {
            case Status.Error:
              return Center(
                child: Text(model.errorMessage),
              );
            case Status.Success:
              return successWidget(model.countryTotal.last);
            case Status.Loading:
            default:
              return LoadingWidget(Colors.white);
          }
        }
    );
  }


  Widget successWidget(CountryTotal ct) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CasesContainer(
              backgroundColor: Color(0xff54E8FF),
              casesName: 'Total Cases',
              numberOfCases: ct.confirmed,
              size: widget.size,
            ),
            CasesContainer(
              backgroundColor: Color(0xffFFCE47),
              casesName: 'Active Cases',
              numberOfCases: ct.active,
              size: widget.size,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CasesContainer(
              backgroundColor: Color(0xff4DFF5F),
              casesName: 'Recoverd Cases',
              numberOfCases: ct.recovered,
              size: widget.size,
            ),
            CasesContainer(
              backgroundColor: Color(0xffFF4D4D),
              casesName: 'Deaths',
              numberOfCases: ct.deaths,
              size: widget.size,
            ),
          ],
        )
      ],
    );
  }
}
