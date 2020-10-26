// TODO: Should this be global news?
import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import '../utils/routes.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID 19 Hotspots'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) =>
            Navigator.pushReplacementNamed(context, Routes.getRoute(value)),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.near_me), title: Text("Near Me")),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city), title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.new_releases), title: Text("News")),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              // width: double.infinity,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Text('US DEATHS'),
                  SizedBox(
                    height: 10.0,
                  ),
                  LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: false,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      titlesData: FlTitlesData(
                          bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (value) {
                          // TODO: This is how to create the dates on the bottom
                          return "$value/$value";
                        },
                      )),
                      lineBarsData: [
                        // TODO: X axis
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 5),
                            FlSpot(1, 7),
                            FlSpot(2, 18),
                            FlSpot(3, 20),
                          ],
                          isCurved: true,
                        ),
                      ],
                      axisTitleData: FlAxisTitleData(
                        leftTitle:
                            AxisTitle(titleText: "Deaths", showTitle: true),
                        bottomTitle:
                            AxisTitle(titleText: "Date", showTitle: true),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
