import 'package:flutter/material.dart';
class location extends StatefulWidget {


  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to the locationpage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('wecome to location page')
          ],
        ),
      ),
    );
  }
}
