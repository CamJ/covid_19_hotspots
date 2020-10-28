import 'package:covid_hotspots/components/covid_navbar.dart';
import 'package:flutter/material.dart';
import 'package:covid_hotspots/components/city_list.dart';
import 'package:covid_hotspots/models/covid_data.dart';
import 'package:covid_hotspots/services/covid_api.dart';
import 'package:provider/provider.dart';

import '../utils/routes.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  CovidAPI api = CovidAPI();
  TextEditingController searchController = TextEditingController();

  // Text Field for Searching Cities,
  // On Search, saves it into searched/saved cities
  // Automatically opens full tile of results
  // Containes a tile list of *quick* view Covid results of that day in city
  @override
  Widget build(BuildContext context) {
    // Search input for city / state
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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.location_city),
                hintText: "Enter a state",
              ),
              onSubmitted: (value) {
                getStateCovidStats(value);
              },
              controller: searchController,
              style: TextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
          CityCovidList(),
        ],
      )),
    );
  }

  void getStateCovidStats(String state) async {
    if (state == null || state.trim().isEmpty) return;

    var data = await api.getCovidStateData(state, yesterday: false);
    Provider.of<CovidDataModel>(context, listen: false).addState(data);
    searchController.clear();
  }
}
