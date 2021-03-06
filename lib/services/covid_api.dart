import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/covid_data.dart';

// Documentation : https://corona.lmao.ninja/docs/#/

// TODO: can add states here, also a single state does not return a list
const String stateApiURL = "https://corona.lmao.ninja/v3/covid-19/states/";

const String countryApiURL = "https://disease.sh/v3/covid-19/countries/";
const String countyApiURL = "https://disease.sh/v3/covid-19/jhucsse/counties/";

// TODO: What pieces of COVID data do I want to get?
class CovidAPI {
  Future<CountryData> getCovidCountryData(String country,
      {bool yesterday = false}) async {
    String url = countryApiURL;
    url += "$country";
    url += "?yesterday=$yesterday";
    url += "&strict=true";

    print(url);
    http.Response data = await http.get(url);

    if (data.statusCode == 200) {
      print(url);
      var jsonData = jsonDecode(data.body);
      CountryData covid = CountryData.fromJSON(jsonData);
      return covid;
    } else {
      print(data.statusCode);
    }

    return null;
  }

  Future<StateData> getCovidStateData(String state,
      {bool yesterday = false}) async {
    String url = stateApiURL;
    url += "$state";
    url += "?yesterday=$yesterday";

    http.Response data = await http.get(url);

    if (data.statusCode == 200) {
      var jsonData = jsonDecode(data.body);
      print(jsonData);
      StateData covid = StateData.fromJSON(jsonData);
      return covid;
    } else {
      print(data.statusCode);
    }

    return null;
  }

  Future<CountyData> getCovidCountyData(String county, String state,
      {bool yesterday = false}) async {
    String url = countyApiURL;
    url += "$county";
    url += "?yesterday=$yesterday";
    url += "&strict=true";

    print(url);
    http.Response data = await http.get(url);

    if (data.statusCode == 200) {
      var jsonData = jsonDecode(data.body);
      print(jsonData);
      print(state);
      for (var countyMap in jsonData) {
        if (countyMap['province'] == state) {
          print(countyMap);
          CountyData covid = CountyData.fromJSON(countyMap);
          return covid;
        }
      }
    } else {
      print(data.statusCode);
    }

    return null;
  }

  Future<Map<String, List<TimelineData>>> getUSHistoricalData() async {
    String url = "https://disease.sh/v3/covid-19/historical/US?lastdays=all";

    http.Response data = await http.get(url);

    if (data.statusCode == 200) {
      var jsonData = jsonDecode(data.body);
      Map cases = jsonData['timeline']['cases'];
      Map deaths = jsonData['timeline']['deaths'];

      Map<String, List<TimelineData>> timelineData =
          <String, List<TimelineData>>{};
      timelineData['cases'] = [];
      timelineData['deaths'] = [];

      cases.forEach((key, value) {
        timelineData['cases'].add(TimelineData(key, value));
      });

      deaths.forEach((key, value) {
        timelineData['deaths'].add(TimelineData(key, value));
      });

      // Convert to daily counts
      var dailyCases = <TimelineData>[];
      var dailyDeaths = <TimelineData>[];

      dailyCases.add(timelineData['cases'].first);
      dailyDeaths.add(timelineData['deaths'].first);

      for (int i = 1; i < timelineData['cases'].length; i++) {
        var yesterday = timelineData['cases'][i - 1];
        var todayOld = timelineData['cases'][i];

        var today =
            TimelineData(todayOld.date, (todayOld.number - yesterday.number));
        dailyCases.add(today);
      }

      for (int i = 1; i < timelineData['deaths'].length; i++) {
        var yesterday = timelineData['deaths'][i - 1];
        var todayOld = timelineData['deaths'][i];

        var today =
            TimelineData(todayOld.date, (todayOld.number - yesterday.number));
        dailyDeaths.add(today);
      }

      timelineData['cases'] = dailyCases;
      timelineData['deaths'] = dailyDeaths;

      return timelineData;
    } else {
      print(data.statusCode);
    }

    return null;
  }

  // TODO: get data from a different URL to get county data
  // https://disease.sh/v3/covid-19/jhucsse/counties/marshall
}
