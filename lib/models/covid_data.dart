import 'package:flutter/material.dart';

class CovidData extends ChangeNotifier {
  // TODO: what do I want this model to look like?
  List<StateData> states = [];

  CovidData(this.states);

  static fromJSON(dynamic jsonData) {
    print("COVID FROM JSON");
    List<StateData> states = [];
    for (var state in jsonData) {
      print(state);
      states.add(StateData.fromJSON(state));
    }

    return CovidData(states);
  }

  static example() {
    List<StateData> states = [
      StateData('Iowa', 1000, 50, 10000, 500),
      StateData('Nevada', 1000, 50, 10000, 500),
      StateData('California', 1000, 50, 10000, 500),
    ];
    return CovidData(states);
  }
}

class StateData {
  String name;
  int todaysCases;
  int todaysDeaths;

  int totalCases;
  int totalDeaths;

  StateData(this.name, this.todaysCases, this.todaysDeaths, this.totalCases,
      this.totalDeaths);

  static fromJSON(dynamic jsonData) {
    return StateData(jsonData['state'], jsonData['todayCases'],
        jsonData['todayDeaths'], jsonData['cases'], jsonData['deaths']);
  }
}

// Example State Data:

/*
  {
    "state": "Texas",
    "updated": 1603402294098,
    "cases": 890642,
    "todayCases": 1129,
    "deaths": 17850,
    "todayDeaths": 64,
    "recovered": 758265,
    "active": 114527,
    "casesPerOneMillion": 30716,
    "deathsPerOneMillion": 616,
    "tests": 8245551,
    "testsPerOneMillion": 284370,
    "population": 28995881
  },
*/
