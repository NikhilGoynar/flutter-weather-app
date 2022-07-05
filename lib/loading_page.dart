import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  getdata() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      getdata();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueGrey,
            backgroundImage: AssetImage("images/weather_image.jpg"),
            minRadius: 50.0,
            maxRadius: 90.0,
          ),
          SizedBox(
            height: 40.0,
          ),
          Text(
            "Mausam App",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Made By Nikhil",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          SpinKitWave(
            color: Colors.black,
            size: 50.0,
          )
        ],
      )),
      backgroundColor: Colors.lightBlue,
    );
  }
}
