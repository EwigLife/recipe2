import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:recipe2/Screen/favorite.dart';
import 'package:recipe2/Widget/privacyPolicy.dart';
import 'package:recipe2/Widget/profileImage.dart';
import 'package:recipe2/controllers/authController.dart';
import 'package:get/get.dart';
import 'package:recipe2/Widget/about.dart';

class SideList extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       physics: BouncingScrollPhysics(),
          child: Container(
            height: 835,
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.6,
        
        child: Column(children: [
            Container(
              color: Color(0xFF27AE60),
              child: ProfileImage(), 
              
            ),
            SizedBox(height: 20),
            ListTile(
                leading: Icon(Icons.favorite_sharp),
                title: Text('Favorite', style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.push(
          context, MaterialPageRoute(builder: (context) => FavoriteRecipe()));
                }),
            ListTile(
              leading: Icon(Icons.warning),
              title: Text('Privacy Policy', style: TextStyle(fontSize: 18)),
              onTap: () => privacy(context),
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('About', style: TextStyle(fontSize: 18)),
              onTap: () => about(context),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out', style: TextStyle(fontSize: 18)),
              onTap: () {
                controller.signOut();
              },
             
            ),
        ]),
      ),
    );
  }
}
