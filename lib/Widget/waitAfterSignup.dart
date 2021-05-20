import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe2/explore.dart';
import 'package:recipe2/welcomScreen.dart';

class Waiting extends StatefulWidget {
  @override
  _WaitingState createState() => _WaitingState();
}

class _WaitingState extends State<Waiting> {
   void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
   startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }
route() {
   Get.to(Welcom()) ;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:CircularProgressIndicator(
  backgroundColor: Colors.green,
),
        ),
      ),
    );
  }
}