import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/covid_card.dart';

import '../services/covid_api.dart';
import '../utils/routes.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CovidAPI covidAPI = CovidAPI();

  @override
  void initState() {
    super.initState();
    covidAPI.getCovidData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => Navigator.pushNamed(context, Routes.getRoute(value)),
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
          children: <Widget>[
            CovidCard(),
            SizedBox(
              height: 10.0,
            ),
            // Make this second one a scrolling, local news tile?
            CovidCard(),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
