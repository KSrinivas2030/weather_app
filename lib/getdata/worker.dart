import 'dart:convert';
import 'package:http/http.dart';

class Worker {
  String? location = "Brazil";

  Worker({required this.location}) {
    location = this.location;
  }

  String? temp;
  String? air_speed;
  String? description;
  String? humidity;
  String? main;
  String? icon;

  Future <void> getData() async
  {
    try
    {
      final String url = "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=521961ff1939f2c4fe6e4ae65b15b833";
      Response response = await get(Uri.parse(url));
      Map data = jsonDecode(response.body);

      //getting temperature humidity;
      Map temp_data = data['main'];
      String? gethumidity = temp_data['humidity'].toString();
      double? gettemp = temp_data['temp']-273.15;

      //getting airspeed,wind;
      Map wind = data['wind'];
      double? airspeed = wind['speed']/0.278;

      //getting description;
      List weather_data = data['weather'];
      Map weather_main = weather_data[0];
      String? get_main_des = weather_main['main'];
      String get_des = weather_main['description'];


      //Assigning values
      temp = gettemp.toString();
      humidity = gethumidity.toString();
      air_speed = airspeed.toString();
      main = get_main_des;
      description=get_des;
      icon = weather_main['icon'];



    }catch(e)
    {
      print(e);
      temp = "error";
      humidity = "Error ";
      air_speed = "Error ";
      main = "Error ";
      icon="03n";


    }

  }

}