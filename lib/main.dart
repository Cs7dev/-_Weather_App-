import 'package:flutter/material.dart';
import 'package:weather_app/Activity/home.dart';
import 'package:weather_app/Activity/loading.dart';
import 'package:weather_app/Activity/location.dart';


void main() {
  runApp(MaterialApp(
    // home: Loading(),

    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/location" : (context) => Location(),
      "/loading" : (context) => Loading(),
    },

  ));
}

