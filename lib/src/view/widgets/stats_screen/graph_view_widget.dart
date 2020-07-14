import 'package:covidhino/src/view/widgets/common/loading_widget.dart';
import 'package:covidhino/src/view_model/covid_provider/covid_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraphViewWdiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GraphViewWdigetState();
}

class GraphViewWdigetState extends State<GraphViewWdiget> {
  bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CovidProvider>(
      builder: (context, model, child) {
        switch (model.allCountryStatus) {
          case Status.Error:
            return Center(
              child: Text(model.errorMessage),
            );
          case Status.Success:
            return successWidget(model);
          case Status.Loading:
          default:
            return Container(
                width: double.infinity,
                height: 200,
                child: LoadingWidget(Color(0xff503CAA)));
        }
      },
    );
  }

  Widget successWidget(CovidProvider model) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
      ),
      child: AspectRatio(
        aspectRatio: 1.23,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 37,
                ),
                const Text(
                  'Logarithmic',
                  style: TextStyle(
                    color: Color(0xff36302E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSans',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                    child: LineChart(
                      sampleData1(model),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  LineChartData sampleData1(CovidProvider model) {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff3B3858),
            fontWeight: FontWeight.bold,
            fontSize: 10,
            fontFamily: 'NotoSans',
          ),
          getTitles: (value) {
            if (value.floor() % 50 == 0) {
              return value.floor().toString();
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff3B3858),
            fontWeight: FontWeight.bold,
            fontSize: 10,
            fontFamily: 'NotoSans',
          ),
          margin: 10,
          getTitles: (value) {
            if (value.floor() % 10000 == 0) {
              return value.floor().toString();
            }
            return '';
          },
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      axisTitleData: FlAxisTitleData(
        show: true,
        bottomTitle: AxisTitle(
          showTitle: true,
          titleText: 'Days',
          textStyle: const TextStyle(
            color: Color(0xff3B3858),
            fontWeight: FontWeight.bold,
            fontSize: 15,
            fontFamily: 'NotoSans',
          ),
        ),
        leftTitle: AxisTitle(
          showTitle: true,
          titleText: 'Cases',
          textStyle: const TextStyle(
            color: Color(0xff3B3858),
            fontWeight: FontWeight.bold,
            fontSize: 15,
            fontFamily: 'NotoSans',
          ),
          margin: 8,
        ),
      ),
      minX: 0,
      maxX: 400,
      maxY: 90050,
      minY: 0,
      lineBarsData: linesBarData1(model),
    );
  }

  List<LineChartBarData> linesBarData1(model) {
    return [
      _createFirstLineChart(),
      _createSecondLineChart(),
      _createThirdLineChart(),
    ];
  }

  LineChartBarData _createFirstLineChart() {
    List<FlSpot> activeflSpot = [];
    Provider.of<CovidProvider>(context).getCountryRecoverStats().forEach(
        (e) => activeflSpot.add(FlSpot(e.y.toDouble(), e.x.toDouble())));

    return LineChartBarData(
      spots: activeflSpot,
      isCurved: true,
      colors: [
        const Color(0xff4DFF5F),
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
  }

  LineChartBarData _createSecondLineChart() {
    List<FlSpot> activeflSpot = [];
    Provider.of<CovidProvider>(context).getCountryDeadStats().forEach(
        (e) => activeflSpot.add(FlSpot(e.y.toDouble(), e.x.toDouble())));

    return LineChartBarData(
      spots: activeflSpot,
      isCurved: true,
      colors: [
        const Color(0xffFF4D4D),
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
  }

  LineChartBarData _createThirdLineChart() {
    List<FlSpot> activeflSpot = [];
    Provider.of<CovidProvider>(context).getCountryActiveStats().forEach(
        (e) => activeflSpot.add(FlSpot(e.y.toDouble(), e.x.toDouble())));

    return LineChartBarData(
      spots: activeflSpot,
      isCurved: true,
      colors: [
        Color(0xffFFCE47),
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
  }
}
