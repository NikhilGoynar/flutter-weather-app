import 'package:http/http.dart';
import 'dart:convert';

class Alldata {
  String location = "";
  String temperature = "";
  String humidity = "";
  String airspeed = "";
  String desc = "";
  String main_w = "";
  String icon = "";
  Alldata({required this.location}) {
    location = this.location;
  }

  getAllData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=682baf82b85143f64328ec4d2a1ece4e"));
      Map data = jsonDecode(response.body);
      Map temp_data = data["main"];
      double temp = temp_data["temp"] - 273.15;
      temperature = temp.toString();
      int humid = temp_data["humidity"];
      humidity = humid.toString();
      Map air_data = data["wind"];
      double airsp = air_data["speed"];
      airspeed = airsp.toString();
      List a = data["weather"];
      Map b = a[0];
      desc = b["description"];
      icon = b["icon"];
      main_w = b["main"];
    } catch (e) {
      print(e);
      temperature = "NA";
      humidity = "NA";
      airspeed = "NA";
      desc = "Not found";
      main_w = "NA";
      icon = "04d";
    }
  }
}
