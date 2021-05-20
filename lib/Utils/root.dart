import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:recipe2/controllers/authController.dart';
import 'package:recipe2/controllers/userController.dart';
import 'package:recipe2/explore.dart';
import 'package:recipe2/login.dart';
import 'package:recipe2/splashScreen.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    //  return GetX(
    //   initState: (_) async {
    //     Get.put<UserController>(UserController());
    //   },
    //   builder: (_) {
    //     if (Get.find<AuthController>().user?.uid != null) {
    //       return Explore();
    //     } else {
    //       return Login();
    //     }
    //   },
    // );
    return Obx((){
return (Get.find<AuthController>().user != null) ?Splash():Login();
    });
  }
}