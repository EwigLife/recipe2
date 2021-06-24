import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe2/explore.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
   void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
   startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }
route() {
   Get.offAll(Explore()) ;
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        children:[
Image.asset("assets/images/logo.png",height: 300,),
SizedBox(height:30),
CircularProgressIndicator(
  backgroundColor: Colors.green,
),

        ]),
      ),

    );
  }
}