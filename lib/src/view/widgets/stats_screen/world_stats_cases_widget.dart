import 'package:covidhino/src/model/entities/world_total_entity.dart';
import 'package:covidhino/src/view/widgets/common/loading_widget.dart';
import 'package:covidhino/src/view/widgets/stats_screen/cases_container.dart';
import 'package:covidhino/src/view_model/covid_provider/covid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorldStatsCasesWidget extends StatefulWidget {
  const WorldStatsCasesWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _WorldStatsCasesWidgetState createState() => _WorldStatsCasesWidgetState();
}

class _WorldStatsCasesWidgetState extends State<WorldStatsCasesWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<CovidProvider>(context, listen: false).getWorldTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer <CovidProvider>(
        builder: (context, model, child) {
          switch (model.allWorldStatus) {
            case Status.Error:
              return Center(
                child: Text(model.worldTotalStruct.errorMessage),
              );
            case Status.Success:
              return successWidget(model.worldTotalStruct.worldTotal);
            case Status.Loading:
            default:
              return LoadingWidget(Colors.white);
          }
        }
    );
  }


  Widget successWidget(WorldTotal wt) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CasesContainer(
              backgroundColor: Color(0xff54E8FF),
              casesName: 'Total Cases',
              numberOfCases: wt.totalConfirmed,
              size: widget.size,
            ),
            CasesContainer(
              backgroundColor: Color(0xffFFCE47),
              casesName: 'Active Cases',
              numberOfCases: 100000,
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
              numberOfCases: wt.totalRecovered,
              size: widget.size,
            ),
            CasesContainer(
              backgroundColor: Color(0xffFF4D4D),
              casesName: 'Deaths',
              numberOfCases: wt.totalDeaths,
              size: widget.size,
            ),
          ],
        )
      ],
    );
  }
}
