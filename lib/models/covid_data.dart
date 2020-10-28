import 'package:flutter/material.dart';

// TODO: What do I want the model of this too look like?

class CovidDataModel extends ChangeNotifier {
  List<StateData> states = [];

  StateData currentState;
  CountryData currentCountry;

  Map<String, List<TimelineData>> timeline;

  CovidDataModel();

  void addUSHistorical(Map<String, List<TimelineData>> data) {
    timeline = data;
    notifyListeners();
  }

  void addStates(List<StateData> states) {
    states.addAll(states);
    notifyListeners();
  }

  void addState(StateData state) {
    states.add(state);
    notifyListeners();
  }

  void addCountry(CountryData country) {
    currentCountry = country;
    notifyListeners();
  }

  void setCurrentState(StateData state) {
    currentState = state;
    notifyListeners();
  }

  void removeState(int index) {
    states.removeAt(index);
    notifyListeners();
  }
}

abstract class CovidData {
  String name;
  int todaysCases;
  int todaysDeaths;

  int yesterdaysCases;
  int yesterdaysDeaths;

  int totalCases;
  int totalDeaths;

  int totalRecovered;

  CovidData(this.name, this.todaysCases, this.todaysDeaths, this.totalCases,
      this.totalDeaths, this.totalRecovered);
}

class StateData extends CovidData {
  StateData(String name, int todaysCases, int todaysDeaths, int totalCases,
      int totalDeaths, int totalRecovered)
      : super(name, todaysCases, todaysDeaths, totalCases, totalDeaths,
            totalRecovered);

  static fromJSON(dynamic jsonData) {
    return StateData(
        jsonData['state'],
        jsonData['todayCases'],
        jsonData['todayDeaths'],
        jsonData['cases'],
        jsonData['deaths'],
        jsonData['recovered']);
  }
}

class CountryData extends CovidData {
  CountryData(String name, int todaysCases, int todaysDeaths, int totalCases,
      int totalDeaths, int totalRecovered)
      : super(name, todaysCases, todaysDeaths, totalCases, totalDeaths,
            totalRecovered);

  static fromJSON(dynamic jsonData) {
    return CountryData(
        jsonData['country'],
        jsonData['todayCases'],
        jsonData['todayDeaths'],
        jsonData['cases'],
        jsonData['deaths'],
        jsonData['recovered']);
  }
}

class TimelineData {
  String date;
  int number;

  TimelineData(this.date, this.number);
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
