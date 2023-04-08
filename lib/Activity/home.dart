import 'dart:convert';

import 'dart:math';

import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:weather_app/Activity/loading.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();


  @override

  @override
  void initState() {
    super.initState();

    print("This is init class");
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("This is Set state");
  }
  @override
  Widget build(BuildContext context){

    var city_name = ["Mumbai","Delhi","Indore","Bhopal","Bhubaneswar"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String temp =((info!['temp_value']).toString()).substring(0,2);
    if(temp == "NA"){
      print("NA");
    }
    String icon = info!['icon_value'];
    String getcity = info!['city_value'];
    String humid = info!['humid_value'];
    String air = info!['air_value'];
    String desc = info!['des_value'];

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0) ,
      //   child: AppBar(
      //     backgroundColor: Colors.black54,
      //   ),
      // ),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: NewGradientAppBar(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlueAccent,
              Colors.blueAccent,
            ],
                begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

      ),

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            stops:
            [
              0.3,
              0.6,
              1.0,
            ],
               colors:
               [
                Colors.white10,
                 Colors.white10,
                 Colors.white10,
               ]
            )
          ),


          child: Column(

            children: [
              Container( //Search Icon (location)
                padding: EdgeInsets.symmetric(horizontal:8 ,vertical:8 ),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white38.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(24)
                ),

                child: Row(

                  children: [
                    GestureDetector(
                      onTap: () {
                        if((searchController.text).replaceAll(" ", "") == "")
                        {
                          print("Black Search");
                        }else{
                          Navigator.pushReplacementNamed(context, "/loading",arguments: {
                            "searchText" : searchController.text,
                          });
                        }

                      },
                      child: Container(child: Icon(Icons.search,color: Colors.blueAccent ,),margin: EdgeInsets.fromLTRB(3, 0, 7, 0),),
                    ),

                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search $city :?"

                        ),

                      ),
                    )
                  ],
                ),
              ),
                Row(
                  children: [
                    Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14) ,
                          gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops:
                          [
                            0.3,
                            1.0,
                          ],
                          colors:
                          [
                            Colors.lightBlueAccent,
                            Colors.lightBlueAccent.shade100

                          ])

                      ),
                      margin: EdgeInsets.symmetric(horizontal: 27),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Text("$desc",style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                              Text("In $getcity",style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade800,
                                fontStyle: FontStyle.italic,
                              ),)
                            ],
                          )
                        ],
                      )

                    ),
              ),
                  ],
                ),
                 Row(
                  children: [
                    Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14) ,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops:
                              [
                                0.3,
                                1.0,
                              ],
                              colors:
                              [
                                Colors.lightBlueAccent,
                                Colors.lightBlueAccent.shade100

                              ])
                      ),

                      margin: EdgeInsets.symmetric(horizontal: 27,vertical: 17),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(WeatherIcons.thermometer),
                          Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$temp ",style: TextStyle(
                                fontSize: 50,
                                color: Colors.white
                              ),),
                              Text("°C",style: TextStyle(
                                fontSize: 27,
                                color: Colors.grey.shade800
                              ),)
                            ],
                          )
                        ],
                      ),

                    ),
              ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14) ,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops:
                              [
                                0.3,
                                1.0,
                              ],
                              colors:
                              [
                                Colors.grey.shade700,
                                Colors.grey.shade600

                              ])
                      ),
                      margin: EdgeInsets.fromLTRB(10, 0, 7, 0),
                      padding: EdgeInsets.all(30),
                      height: 150,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                WeatherIcons.day_windy ,  color: Colors.white
                              ),
                              Text("    Wind Speed",style: TextStyle(

                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.white
                              ),)
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("$air",style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text("mph",style: TextStyle(
                            fontSize: 15,
                              color: Colors.white,
                              fontStyle: FontStyle.italic),),
                        ],
                      ),

                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14) ,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops:
                              [
                                0.3,
                                1.0,
                              ],
                              colors:
                              [
                                Colors.grey.shade700,
                                Colors.grey.shade600

                              ])
                      ),
                      margin: EdgeInsets.fromLTRB(7, 0, 10, 0),
                      padding: EdgeInsets.all(30),
                      height: 150,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                WeatherIcons.humidity, color: Colors.white
                              ),
                              Text("  Humidity",style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),)
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("$humid %",style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),

                    ),
                  ),
                ],
              ),
              Container( //apply margin and padding using Container Widget.
                padding: EdgeInsets.fromLTRB(0, 100, 0, 0), //You can use EdgeInsets like above
                margin: EdgeInsets.all(5),
                child: Text("Made by Cs7dev", style: TextStyle(color: Colors.blueAccent)),


              ),


            ],
          ),
        //
        ),
      ),

    );
  }
}

