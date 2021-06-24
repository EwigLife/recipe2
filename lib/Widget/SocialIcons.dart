import 'package:auth_buttons/res/buttons/facebook_auth_button.dart';
import 'package:auth_buttons/res/buttons/google_auth_button.dart';
import 'package:auth_buttons/res/shared/auth_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:recipe2/controllers/authController.dart';

import '../explore.dart';

class Socialicon extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Container(
        //   child: FacebookAuthButton(
        //     onPressed: () {
        //       // await controller.signInFacebook();
        //       // Get.to(() => Explore());
        //     },
        //     darkMode: false,
        //     style: AuthButtonStyle.icon,
        //   ),
        // ),
        SizedBox(
          width: 35,
        ),
        InkWell(
          onTap: ()async {
                      await controller.signInWithGoogle();
                      Get.to(() => Explore());
                    },
                  child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
      BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(5, 5), // Shadow position
      ),
    ],
               borderRadius: BorderRadius.all(
              Radius.circular(10.0)),
              
               
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: GoogleAuthButton(
                    onPressed: () async {
                      await controller.signInWithGoogle();
                      Get.to(() => Explore());
                    },
                    style: AuthButtonStyle.icon,
                  ),
                ),
                Container(padding: EdgeInsets.all(5),
                  child:
                Text("Google",style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 18,
                ),))
              ],
            ),
          ),
        ),
        SizedBox(width: 15),
      ],
    );
  }
}
