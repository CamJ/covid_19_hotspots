import 'package:flutter/material.dart';

import '../screens/home_page.dart';
import '../screens/info_screen.dart';
import '../screens/news_screen.dart';
import '../screens/search_screen.dart';

class Routes {
  static const NEAR_ME = '/near_me';
  static const SEARCH = '/search';
  static const NEWS = '/news';
  // Add app wide routes here that are then used in main or the widget itself
  // Could even have the map within here

  // Alternatively, add a static 'route' string on each widget and build up here or in main
}

Map<String, Function> appRouteMap = <String, Function>{
  Routes.NEAR_ME: (context) => MyHomePage(
        title: 'Covid 19 Hotspots',
      ),
  Routes.SEARCH: (context) => SearchScreen(),
  // Routes.NEWS : (context) => N(),
};
