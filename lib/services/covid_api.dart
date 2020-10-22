import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/covid_data.dart';

// Documentation : https://corona.lmao.ninja/docs/#/

// TODO: can add states here, also a single state does not return a list
const String apiURL =
    "https://corona.lmao.ninja/v3/covid-19/states/iowa%2Cnevada";

// TODO: What pieces of COVID data do I want to get?
class CovidAPI {
  Future<dynamic> getCovidData() async {
    String url = apiURL;

    http.Response data = await http.get(url);

    if (data.statusCode == 200) {
      print(data.body);
      var jsonData = jsonDecode(data.body);
      CovidData covid = CovidData.fromJSON(jsonData);
      print(covid.states.length);
    } else {
      print(data.statusCode);
    }
  }
}
