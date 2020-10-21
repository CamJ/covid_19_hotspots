import 'dart:async';

import 'package:http/http.dart' as http;

// Documentation : https://corona.lmao.ninja/docs/#/

const String apiURL = "https://corona.lmao.ninja/v3/covid-19/states";

// TODO: What pieces of COVID data do I want to get?
class CovidAPI {
  Future<dynamic> getCovidData() async {
    String url = apiURL;

    http.Response data = await http.get(url);

    if (data.statusCode == 200) {
      print(data.body);
    } else {
      print(data.statusCode);
    }
  }
}
