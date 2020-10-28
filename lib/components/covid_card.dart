import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/covid_data.dart';

import 'package:fl_chart/fl_chart.dart';

class CovidCard extends StatelessWidget {
  final CovidData data;

  const CovidCard({this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF242635),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Statistics'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  data.name,
                  textAlign: TextAlign.center,
                )),
                // TODO: What charts to show?
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Todays Deaths",
                  textAlign: TextAlign.center,
                )),
                Expanded(
                    child: Text(
                  data.todaysDeaths.toString(),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Total Deaths",
                  textAlign: TextAlign.center,
                )),
                Expanded(
                    child: Text(
                  data.totalDeaths.toString(),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Todays Cases",
                  textAlign: TextAlign.center,
                )),
                Expanded(
                    child: Text(
                  data.todaysCases.toString(),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Total Cases",
                  textAlign: TextAlign.center,
                )),
                Expanded(
                    child: Text(
                  data.totalCases.toString(),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            // Row(
            //   children: [
            //     LineChart(LineChartData()),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
