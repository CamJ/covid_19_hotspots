import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:covid_hotspots/models/covid_data.dart';

class CovidChart extends StatelessWidget {
  final String title;
  final List<TimelineData> data;

  const CovidChart({
    this.title,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = [];

    for (int i = 0; i < data.length; i++) {
      spots.add(FlSpot(i.toDouble(), data[i].number.toDouble()));
    }
    return Container(
      // width: double.infinity,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFF242635),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text('US $title'),
          SizedBox(
            height: 10.0,
          ),
          LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                rotateAngle: 90.0,
                showTitles: true,
                getTitles: (value) {
                  // TODO: instead of doing this here, should be done with CheckShowTitles function
                  if (value.toInt() % 5 == 0) return data[value.toInt()].date;

                  return "";
                  // TODO: This is how to create the dates on the bottom
                },
              )),
              lineBarsData: [
                // TODO: X axis
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                ),
              ],
              axisTitleData: FlAxisTitleData(
                leftTitle: AxisTitle(titleText: "Deaths", showTitle: true),
                bottomTitle: AxisTitle(titleText: "Date", showTitle: true),
              ),
            ),
          )
        ],
      ),
    );
  }
}
