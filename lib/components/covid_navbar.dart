import 'package:flutter/material.dart';
import '../utils/routes.dart';

class CovidNavbar extends StatelessWidget {
  const CovidNavbar();

  // TODO: Why is this not taking the background color?
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        BottomNavigationBarItem(
            icon: Icon(Icons.show_chart), title: Text("Trends")),
      ],
    );
  }
}
