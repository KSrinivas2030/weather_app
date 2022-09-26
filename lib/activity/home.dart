import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'package:http/http.dart';
import 'dart:math';

import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();





  @override

  void initState() {
    // TODO: implement initState
    super.initState();

    
    print("This is init state");
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("set state called");
  }
  @override

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("program ended");
  }
  @override


  Widget build(BuildContext context) {

    var city_name =["Delhi","Hyderabad","Mumbai","Chennai","Chandigarh","Banglore"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
      Map? info = ModalRoute.of(context)!.settings.arguments as Map?;
    String temp = ((info!["temp_value"]).toString()).substring(0,4);
    String icon=info['icon_value'].toString();
    String sscity=info['city_value'].toString();
    String? hum=info['humidity'].toString();
    String air = (info['airspedd'].toString()).substring(0,4);
    String des = info['description'];


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: NewGradientAppBar(
          gradient: LinearGradient(
            colors: [
              Colors.orange,
              Colors.white,
              Colors.green,
            ]
          ),
        )
        ),

      body:SingleChildScrollView(
        child: SafeArea(

          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.orange,
                Colors.white,
                Colors.green,

              ],
                begin:Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ),
            child: Column(
               children: [
                 Container(


                   padding: EdgeInsets.symmetric(horizontal: 8),
                   margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10,),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(24),
                   ),

                   child: Row(
                     children: [
                       SizedBox(height: 10,width: 10,),
                       GestureDetector(

                        onTap: (){
                          Navigator.pushNamed(context, "/loading",arguments:
                            searchController.text,

                          );
                        },
                        child: Container( child:Icon(Icons.search,size: 20,color: Colors.blueAccent,),
                        margin:EdgeInsets.fromLTRB(5, 2, 10, 5),
                        ),
                       ),
                       Expanded(
                           child: TextField(
                         controller: searchController,
                         decoration: InputDecoration(
                           hintText:'Search $city',
                           border:InputBorder.none,
                         ),)
                       )
                     ],
                   ),
                 ),
                 SizedBox(height: 10,width: 10,),
                 Row(
                   children: [
                     Expanded(child:Container(

                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         color: Colors.white.withOpacity(0.5),
                       ),
                       margin: EdgeInsets.symmetric(horizontal: 20),
                       padding: EdgeInsets.all(26),
                       child: Row(
                         children: [
                           Image.network('http://openweathermap.org/img/wn/$icon@2x.png',),
                           SizedBox(width: 4,),
                           Column(
                             children: [
                               Text('$des',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                               SizedBox(height: 5,width: 5,),
                               Text('$sscity',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                             ],
                           ),
                         ],
                       ),
                     ),
                     ),
                   ],
                 ),
                  SizedBox(height: 5,width: 5,),
                 
                 Row(
                   children: [
                     Expanded(
                       child: Container(
                           height: 250,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15),
                           color: Colors.white.withOpacity(0.5),
                         ),
                         margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                         padding: EdgeInsets.all(50),
                         child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Icon(WeatherIcons.wiThermometer),
                             Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text("$temp",style: TextStyle(fontSize: 90,fontWeight: FontWeight.bold),),
                                 SizedBox(width: 3,),
                                 Text("C",style: TextStyle(fontSize: 30),)
                               ],
                             ),

                           ],

                         ),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(height: 5,width: 5,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Expanded(
                       child: Container(
                         height: 150,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15),
                           color: Colors.white.withOpacity(0.5),
                         ),
                         margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                         padding: EdgeInsets.all(26),
                         child: Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Icon(WeatherIcons.wiDayWindy),
                               ],
                             ),
                             SizedBox(height: 15,),
                             Text("$air",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                             Text("km/h",style: TextStyle(fontSize: 15,),)
                           ],
                         ),
                       ),
                     ),
                     Expanded(child: Container(
                       height: 150,

                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         color: Colors.white.withOpacity(0.5),
                       ),
                       margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                       padding: EdgeInsets.all(26),
                       child: Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Icon(WeatherIcons.wiHumidity),
                             ],
                           ),
                           SizedBox(height: 15,),
                           Text("$hum",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                           Text("Percent",style: TextStyle(fontSize: 15,),),
                         ],
                       ),
                     ),
                     ),


                   ]
                 ),
                 SizedBox(height: 40,width: 40,),
                 Container(
                   padding: EdgeInsets.all(10),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text('made by Srinu',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
                       Text('Data provided by Openweatherapi.org',style: TextStyle(fontSize: 15,color:Colors.white,fontWeight:FontWeight.bold,fontStyle: FontStyle.italic)),
                     ],

                   ),
                 )
               ],
            ),
          ),
        ),
      ),


    );
  }
}
