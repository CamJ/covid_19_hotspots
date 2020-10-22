import 'package:flutter/material.dart';

import 'package:flutter_app_template/models/covid_data.dart';

class CityCovidList extends StatelessWidget {
  final CovidData data = CovidData.example();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Text(data.states[index].name);
        },
        itemCount: data.states.length,
      ),
    );
  }
}
