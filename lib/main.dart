import 'package:flutter/material.dart';
import 'package:covid_hotspots/screens/home_page.dart';
import 'package:covid_hotspots/screens/news_screen.dart';
import 'package:covid_hotspots/utils/routes.dart';
import 'package:provider/provider.dart';

import './screens/search_screen.dart';
import './screens/loading_screen.dart';
import 'models/covid_data.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (context) => CovidDataModel(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Covid 19 Hotspots', // TODO
        initialRoute: Routes.LOADING,
        routes: {
          Routes.LOADING: (context) => LoadingScreen(),
          Routes.NEAR_ME: (context) => MyHomePage(
                title: 'Covid 19 Hotspots',
              ),
          Routes.SEARCH: (context) => SearchScreen(),
          Routes.NEWS: (context) => NewsScreen(),
        },
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF1A1C26),
          backgroundColor: Color(0xFF1A1C26),
        ));
  }
}
