import 'dart:convert';
import 'package:http/http.dart';
class worker
{
  late String location;
  //Contructor
  worker({required this.location})
  {
    location = this.location;
  }

  late String temp;
  late String humid;
  late String air_speed;
  late String description;
  late String main;
  late String icon;
  late String city;

  //method=

 Future<void> getData () async
  {
    try{
      Response response= await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=8cca60bfea65d10c6460625a37fa2393"));
      Map data = jsonDecode(response.body);
      //Getting temp,Humidity,wind
      Map temp_data = data['main'];
      //Humid
      String getHumid = temp_data['humidity'].toString();
      double getTemp = temp_data['temp']-273.15;
      //Air_speed
      Map wind = data['wind'];
      String getAir_speed = wind["speed"].toString();

      //Getting description:
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];



      //Assigning values to the string
      temp = getTemp.toString();
      humid = getHumid;
      air_speed = getAir_speed;
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data["icon"].toString();
      city = location;




    }catch(err)
    {
      temp = "Can't Find Data! Wrong Location It doesn't exist";
      humid = "Can't Find Data! Wrong Location It doesn't exist";
      air_speed = "Can't Find Data! Wrong Location It doesn't exist";
      description = "Can't Find Data! Wrong Location It doesn't exist";
      main = "Can't Find Data! Wrong Location It doesn't exist";
      icon = "03n";
    }
    }



}


