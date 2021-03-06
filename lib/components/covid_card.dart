import 'package:flutter/material.dart';
import 'package:covid_hotspots/models/covid_data.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class CovidCard extends StatelessWidget {
  final CovidData data;
  final String type;

  const CovidCard({this.data, this.type});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF242635),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              type.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'INFECTED',
                      style: GoogleFonts.roboto(
                          color: Color(0xFFDE952C),
                          fontWeight: FontWeight.bold),
                      // style: TextStyle(color: Color(0xFFDE952C)),
                    ),
                    Text(
                      data.totalCases.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                    ),
                    Row(
                      children: [
                        Text('15%'),
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'RECOVERED',
                      style: GoogleFonts.roboto(
                          color: Color(0xFF13DB94),
                          fontWeight: FontWeight.bold),
                      // style: TextStyle(color: Color(0xFF13DB94)),
                    ),
                    Text(
                      data.totalRecovered.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                    ),
                    Row(
                      children: [
                        Text('15%'),
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'DEATHS',
                      style: GoogleFonts.roboto(
                          color: Color(0xFFC2484C),
                          fontWeight: FontWeight.bold),
                      //style: TextStyle(color: Color(0xFFC2484C)),
                    ),
                    Text(
                      data.totalDeaths.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                    ),
                    Row(
                      children: [
                        Text('15%'),
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.green,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
