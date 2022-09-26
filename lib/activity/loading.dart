import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../getdata/worker.dart';
import 'dart:core';

class loading extends StatefulWidget {



  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
   String city="Brazil";
  String? temp2;
 String? hum;
 String? air_speed;
 String? des;
 String? main;
 String? icon;


Future <void> startApp(String city) async {
  Worker instance = Worker(location: city);
   await instance.getData();
   temp2=instance.temp;
   hum=instance.humidity;
   air_speed=instance.air_speed;
   des=instance.description;
   main=instance.main;
   icon=instance.icon;
   Future.delayed(Duration(seconds: 3),(){
     Navigator.pushReplacementNamed(context, '/home',arguments: {
       "temp_value":temp2,
       "humidity":hum,
       "airspedd":air_speed,
       "description":des,
       "icon_value":icon,
       "city_value":city,
     });

   });


}
  @override
  void initState() {
    // TODO: implement initState;

    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    String? searchs = ModalRoute.of(context)?.settings.arguments as String;
    city=searchs;
   //if(searchs.isEmpty ?? false)
    //  {
     //   city=searchs['searchText'];
    //  }

    startApp(city);
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[

                Image.asset("assets/images/ss.png",width: 150,height: 150,),
                Text('DIGITAL WEATHER APP ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text('Made by Srinu',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold,fontStyle: FontStyle.italic
              ),),
              SizedBox(height: 20,width: 20,),

             SpinKitWave(
              color: Colors.pinkAccent,
              size: 50.0,
            ),
              ],
            ),
          ),
        ),
    );
  }
}
