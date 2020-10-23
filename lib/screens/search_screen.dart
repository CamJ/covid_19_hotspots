import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/city_list.dart';

import '../utils/routes.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  // Text Field for Searching Cities,
  // On Search, saves it into searched/saved cities
  // Automatically opens full tile of results
  // Containes a tile list of *quick* view Covid results of that day in city
  @override
  Widget build(BuildContext context) {
    // Search input for city / state
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID 19 Hotspots'),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            onSubmitted: (value) {
              getStateCovidStats(value);
            },
            controller: searchController,
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
          CityCovidList(),
        ],
      )),
    );
  }

  void getStateCovidStats(String state) {}
}
