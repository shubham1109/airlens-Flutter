import 'dart:async';

import 'package:flutter/material.dart';
import 'package:airlens/tutorial.dart';

import 'package:airlens/home.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(new MaterialApp(
    theme: new ThemeData(

    ),

    home: new SplashScreen(),
    routes:<String,WidgetBuilder>{
      "/tutorial":(BuildContext context) => new Tutorial(),
      "/home":(BuildContext context) => new MyHomePage()
    },
  ));
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  setStartupVariables() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isNewUser", true);
    prefs.setDouble("lastLat", null);
    prefs.setDouble("lastLong", null);
    prefs.setDouble("lastAQI", null);
    prefs.setStringList("otherLat", null);
    prefs.setStringList("otherLong", null);
    prefs.setStringList("otherLocationNames", null);
    prefs.setStringList("otherLocationAQI", null);
    prefs.setString("lastRefresh", null);
  }
  startTime() async {
    var _duration = new Duration(seconds: 2);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.get("isNewUser")==null){
      setStartupVariables();
      return new Timer(_duration, navigationTutorial);
    }
    return new Timer(_duration, navigationHome);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void navigationTutorial()  {
    Navigator.of(context).pushReplacementNamed("/tutorial");
  }
  void navigationHome() {
    Navigator.of(context).pushReplacementNamed("/home");
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body:new Hero(tag: "splashImage", child:  new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/splash.png"),
              fit: BoxFit.cover
          )
        ),child: null
      ))
    );
  }
}
