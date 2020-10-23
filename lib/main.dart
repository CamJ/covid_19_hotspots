import 'package:flutter/material.dart';
import 'package:flutter_app_template/screens/home_page.dart';
import 'package:flutter_app_template/screens/news_screen.dart';
import 'package:flutter_app_template/utils/routes.dart';
import 'package:provider/provider.dart';

import './screens/search_screen.dart';
import 'models/covid_data.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (context) => CovidData([]),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Covid 19 Hotspots', // TODO
        initialRoute: Routes.NEAR_ME,
        routes: {
          Routes.NEAR_ME: (context) => MyHomePage(
                title: 'Covid 19 Hotspots',
              ),
          Routes.SEARCH: (context) => SearchScreen(),
          Routes.NEWS: (context) => NewsScreen(),
        },
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black,
          backgroundColor: Colors.black26,
        ));
  }
}
