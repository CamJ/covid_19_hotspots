import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Text Field for Searching Cities,
  // On Search, saves it into searched/saved cities
  // Automatically opens full tile of results
  // Containes a tile list of *quick* view Covid results of that day in city
  @override
  Widget build(BuildContext context) {
    return Container(
      child: // Search input for city / state
          TextField(),
    );
  }
}
