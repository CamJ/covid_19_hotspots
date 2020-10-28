import 'package:flutter/material.dart';
import 'package:covid_hotspots/components/covid_card.dart';
import 'package:covid_hotspots/components/covid_chart.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1C26),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1A1C26),
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
        child: Container(
          // height: 500, // TODO: without this I runinto layout issues
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${Provider.of<CovidDataModel>(context, listen: false).location}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              // TODO: The closest county/city stats if possible
              CovidCard(
                  data: Provider.of<CovidDataModel>(context, listen: false)
                      .currentCounty,
                  type: 'County'),
              SizedBox(
                height: 10.0,
              ),
              // Make this second one a scrolling, local news tile?
              // TODO: maybe it's a trending scrolling list of highest covid cases, or states on the rise - move this elsewhere
              // TODO: This can be the state stats
              CovidCard(
                  data: Provider.of<CovidDataModel>(context, listen: false)
                      .currentState,
                  type: 'State'),
              SizedBox(
                height: 10.0,
              ),
              // TODO: This can be the US country stats and trends
              CovidCard(
                  data: Provider.of<CovidDataModel>(context, listen: false)
                      .currentCountry,
                  type: 'Country'),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
