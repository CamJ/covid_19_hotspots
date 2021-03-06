// TODO: Should this be global news?
import 'package:covid_hotspots/components/covid_navbar.dart';
import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:covid_hotspots/components/covid_chart.dart';
import 'package:covid_hotspots/models/covid_data.dart';
import 'package:provider/provider.dart';

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
      backgroundColor: Color(0xFF1A1C26),
      appBar: AppBar(
        title: Text('COVID 19 Hotspots'),
      ),
      bottomNavigationBar: CovidNavbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CovidChart(
                title: "Cases",
                data: Provider.of<CovidDataModel>(context, listen: false)
                    .timeline['cases']),
            CovidChart(
                title: "Deaths",
                data: Provider.of<CovidDataModel>(context, listen: false)
                    .timeline['deaths']),
          ],
        ),
      ),
    );
  }
}
