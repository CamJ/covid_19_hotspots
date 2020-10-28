import 'package:flutter/material.dart';
import 'package:covid_hotspots/models/covid_data.dart';
import 'package:covid_hotspots/services/covid_api.dart';
import 'package:covid_hotspots/services/location.dart';
import 'package:covid_hotspots/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:us_states/us_states.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  CovidAPI covidAPI = CovidAPI();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future getLocation() async {
    Location location = Location();
    await location.getLocation();
    StateData currentState =
        await covidAPI.getCovidStateData(USStates.getName(location.getState()));

    StateData yesterday = await covidAPI.getCovidStateData(
        USStates.getName(location.getState()),
        yesterday: true);

    if (yesterday != null) {
      currentState.yesterdaysCases = yesterday.todaysCases;
      currentState.yesterdaysDeaths = yesterday.totalDeaths;
    }

    CountryData countryToday =
        await covidAPI.getCovidCountryData(location.getCountry());

    CountryData countryYesterday = await covidAPI
        .getCovidCountryData(location.getCountry(), yesterday: true);

    if (countryYesterday != null) {
      countryToday.yesterdaysCases = countryYesterday.todaysCases;
      countryToday.yesterdaysDeaths = countryYesterday.todaysDeaths;
    }

    CountyData countyToday = await covidAPI.getCovidCountyData(
        location.getCounty(), USStates.getName(location.getState()));

    var timelineData = await covidAPI.getUSHistoricalData();

    // TODO: Calculate daily values with current day - lyesterday

    Provider.of<CovidDataModel>(context, listen: false)
        .addUSHistorical(timelineData);

    Provider.of<CovidDataModel>(context, listen: false)
        .setCurrentState(currentState);
    Provider.of<CovidDataModel>(context, listen: false)
        .addCountry(countryToday);
    Provider.of<CovidDataModel>(context, listen: false)
        .setCurrentCounty(countyToday);

    Navigator.pushReplacementNamed(context, Routes.NEAR_ME);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
