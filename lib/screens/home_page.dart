import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/covid_card.dart';
import 'package:provider/provider.dart';
import 'package:us_states/us_states.dart';
import 'package:fl_chart/fl_chart.dart';

import '../models/covid_data.dart';
import '../services/covid_api.dart';
import '../utils/routes.dart';
import '../services/location.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CovidAPI covidAPI = CovidAPI();

  StateData currentState;

  @override
  void initState() {
    super.initState();
    if (currentState == null) {
      Location location = Location();
      location.getLocation().then((_) async {
        currentState = await covidAPI
            .getCovidStateData(USStates.getName(location.getState()));

        StateData yesterday = await covidAPI
            .getCovidStateData(USStates.getName(location.getState()));

        currentState.yesterdaysCases = yesterday.todaysCases;
        currentState.yesterdaysDeaths = yesterday.totalDeaths;

        Provider.of<CovidDataModel>(context, listen: false)
            .setCurrentState(currentState);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
        child: SingleChildScrollView(
          child: Container(
            height: 1000, // TODO: without this I runinto layout issues
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // TODO: The closest county/city stats if possible
                CovidCard(
                    data: Provider.of<CovidDataModel>(context, listen: false)
                        .currentState),
                SizedBox(
                  height: 10.0,
                ),
                // Make this second one a scrolling, local news tile?
                // TODO: maybe it's a trending scrolling list of highest covid cases, or states on the rise - move this elsewhere
                // TODO: This can be the state stats
                CovidCard(
                    data: Provider.of<CovidDataModel>(context, listen: false)
                        .currentState),
                SizedBox(
                  height: 10.0,
                ),
                // TODO: This can be the US country stats and trends
                CovidCard(
                    data: Provider.of<CovidDataModel>(context, listen: false)
                        .currentState),
                SizedBox(
                  height: 10.0,
                ),
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
        ),
      ),
    );
  }
}
