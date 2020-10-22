// TODO: Should this be global news?
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
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
          children: <Widget>[],
        ),
      ),
    );
  }
}
