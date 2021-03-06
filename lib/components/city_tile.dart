import 'package:flutter/material.dart';

import 'package:covid_hotspots/models/covid_data.dart';

class CityCovidTile extends StatelessWidget {
  final StateData state;

  const CityCovidTile({this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xFF242635),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "State",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Expanded(
                  child: Text(
                "Todays Deaths",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Expanded(
                  child: Text(
                "Todays Cases",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ],
          ),
          Divider(
            height: 10.0,
            thickness: 1.5,
            color: Colors.white,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                state.name,
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                state.todaysDeaths.toString(),
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                state.todaysCases.toString(),
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
