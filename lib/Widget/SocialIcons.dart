import 'package:auth_buttons/res/buttons/facebook_auth_button.dart';
import 'package:auth_buttons/res/buttons/google_auth_button.dart';
import 'package:auth_buttons/res/shared/auth_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:recipe2/Screen/explore.dart';
import 'package:recipe2/controllers/authController.dart';
class Socialicon extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
 
        SizedBox(
          width: 10,
        ),
        Container(
        child: GoogleAuthButton(
          onPressed: () async {
        await controller.signInWithGoogle();
        Get.to(() => Explore());
          },
          style: AuthButtonStyle.icon,
        ),
        ),
       
        SizedBox(width: 15),
      ],
    );
  }
}
