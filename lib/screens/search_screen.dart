import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/city_list.dart';
import 'package:flutter_app_template/models/covid_data.dart';
import 'package:flutter_app_template/services/covid_api.dart';
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
