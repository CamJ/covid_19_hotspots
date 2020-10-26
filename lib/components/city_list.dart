import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_app_template/models/covid_data.dart';

import 'city_tile.dart';

class CityCovidList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CovidDataModel>(
      builder: (context, value, child) {
        return Expanded(
            child: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemBuilder: (context, index) {
            return CityCovidTile(state: value.states[index]);
          },
          itemCount: value.states.length,
        ));
      },
    );
  }
}
