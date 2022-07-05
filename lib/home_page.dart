import 'package:flutter/material.dart';
import 'package:weather_app/model.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String tempp = "";
  String Iconic = "04d";
  String Desc = "";
  String city = "Indore";
  String wind_speed = "";
  String humidity = "";
  int count = 0;
  TextEditingController searchController = new TextEditingController();
  getdata() async {
    String locat = searchController.text.toString().trim();
    if (locat.replaceAll(" ", "") == "" && count == 0) {
      print("Not found");
    } else {
      searchController.clear();
      String defloc = "Indore";
      if (count == 1) {
        locat = defloc;
        count--;
      }
      Alldata instance = Alldata(location: "$locat");
      await instance.getAllData();
      setState(() {
        tempp = instance.temperature;
        if (tempp != "NA") {
          tempp = tempp.substring(0, 4);
        }
        Iconic = instance.icon;
        Desc = instance.desc;
        city = locat;
        wind_speed = instance.airspeed;
        humidity = instance.humidity;
      });
    }
  }

  @override
  void initState() {
    count = 1;
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blueAccent, Color.fromARGB(255, 179, 190, 199)],
              )),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    margin: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: GestureDetector(
                                onTap: () {
                                  getdata();
                                },
                                child: Icon(Icons.search))),
                        Expanded(
                            child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter City Name',
                              hintText: 'Enter City Name'),
                        ))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Row(children: [
                            Image.network(
                                "http://openweathermap.org/img/wn/$Iconic@2x.png"),
                            SizedBox(width: 15),
                            Column(
                              children: [Text("$Desc"), Text("in $city")],
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.wiThermometer),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$tempp",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50),
                                  ),
                                  Text(
                                    "c",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Container(
                        height: 200,
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.wiCloudy),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "$wind_speed",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                    Text("m/s")
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        height: 200,
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.wiHumidity),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "$humidity",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                    Text("%")
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 22, 0, 0),
                    child: Column(children: [
                      Text("Made By Nikhil"),
                      Text("Data Provided by OpenWeather.org")
                    ]),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
