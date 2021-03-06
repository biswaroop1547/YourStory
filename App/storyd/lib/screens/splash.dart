import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyd/global_values.dart';
import 'package:storyd/screens/auth.dart';
import 'package:storyd/screens/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1800), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getBool(isLoggedInPrefKey) == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => LoginPage(),
            transitionDuration: Duration(milliseconds: 1000),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "storyd-splash",
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Material(
                child: Text(
                  "Storyd",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 55,
                    fontFamily: "CircularStd",
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset("assets/storyd-splash.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
