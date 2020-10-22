import 'package:flutter/material.dart';

class CovidCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Statistics'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text('LOCATION'),
                SizedBox(width: 20.0),
                Text('INsert chart here'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
