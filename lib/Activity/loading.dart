import 'package:flutter/material.dart';
import 'package:weather_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String temp;
  late String hum;
  late String air_speed;
  late String des;
  late String main;
  late String icon;
  late String city = "Mumbai";

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();
    //print(instance.humid);
    temp = instance.temp;
    hum = instance.humid;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(Duration(seconds: 2), (){
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "temp_value" : temp,
      "humid_value" : hum,
      "air_value" : air_speed,
      "des_value" : des,
      "main_value" : main,
      "icon_value" : icon,
      "city_value" : city,



    });
  });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if(search?.isNotEmpty ?? false)
      {
        city = search!['searchText'];
      }
    startApp(city);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Image.asset("images/logo.png",height: 180,width: 180,),
            SizedBox(height: 15,),
            Text("ऋतु", style: TextStyle(fontSize: 80,color:Colors.black87),),

            SizedBox(height: 20,),
          SpinKitFadingCube(
          color: Colors.black87,
          size: 50.0,
          ),
            SizedBox(height: 100,),
            Text("Made By Cs7dev", style: TextStyle(
                fontSize: 17
            ),),

          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent[400],
    );
  }
}
// child: Column(children: <Widget> [
//     ElevatedButton.icon(onPressed: (){ Navigator.pushNamed(context, "/home");
//     }, icon: const Icon(Icons.add_to_home_screen), label: Text("Loading"))],
