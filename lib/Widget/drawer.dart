
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe2/Widget/privacyPolicy.dart';
import 'package:recipe2/Widget/profileImage.dart';
import 'package:recipe2/explore.dart';
import 'package:recipe2/Widget/about.dart';

class SideList extends StatefulWidget {
  @override
  _SideListState createState() => _SideListState();
}

class _SideListState extends State<SideList> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
             width:   ScreenUtil.getInstance().setWidth(430),
                       
      child: Column(children: [
        Container(
          child: ProfileImage(),
          ),
       
        SizedBox(height: ScreenUtil.getInstance().setHeight(20)),
       
        // ListTile(
          
        //     leading: Icon(Icons.brightness_6),
        //     title: Text('Dark Mode', style: TextStyle(fontSize: 18)),
        //     onTap: () {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => Explore()));
        //     }),
        
        ListTile(
            leading: Icon(Icons.favorite_sharp),
            title: Text('Favorite', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Explore()));
            }),
       
        // ListTile(
        //     leading: Icon(Icons.settings),
        //     title: Text('Setting', style: TextStyle(fontSize: 18)),
        //     onTap: () {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => Explore()));
        //     }),
             
            ListTile(
            leading: Icon(Icons.warning),
            title: Text('Privacy Policy', style: TextStyle(fontSize: 18)),
            onTap: () =>privacy(context),
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Explore()));
            }),
      ]),
    );
  }
}
