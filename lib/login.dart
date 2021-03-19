import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe2/explore.dart';
import 'package:recipe2/signUp.dart';
import 'Widget/loginFormCard.dart';
import 'Widget/SocialIcons.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}
class _LoginState extends State<Login> {


 

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset("assets/images/foods.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(child: Image.asset("assets/images/image_02.png"))
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 120.0),
              child: Column(
                children: <Widget>[
                  // Row(
                  //   children: <Widget>[
                  //     Image.asset(
                  //       "assets/images/logo.png",
                  //       width: ScreenUtil.getInstance().setWidth(110),
                  //       height: ScreenUtil.getInstance().setHeight(110),
                  //     ),
                  //     Text("LOGO",
                  //         style: TextStyle(
                  //             fontFamily: "Poppins-Bold",
                  //             fontSize: ScreenUtil.getInstance().setSp(46),
                  //             letterSpacing: .6,
                  //             fontWeight: FontWeight.bold))
                  //   ],
                  // ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(180),
                  ),
                  LoginFormCard(),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  Column(
                    children: [
                      ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      Text("Social Login",
                          style: TextStyle(
                              fontSize: 16.0, fontFamily: "Poppins-Medium")),
                      horizontalLine()
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                socialicon(),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "New User? ",
                        style: TextStyle(fontFamily: "Poppins-Medium"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>SignUp()));
                        },
                        child: Text("SignUp",
                            style: TextStyle(
                                color: Color(0xFF27AE60),
                                fontFamily: "Poppins-Bold")),
                      ),
                      SizedBox(height: 20,),
                      
                    ],
                  ),
                  SizedBox(height: 20),
                   InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>Explore()));
                        },
                        child: Text("Skip",
                            style: TextStyle(
                              fontSize: 20,
                                color: Color(0xFF27AE60),
                                fontFamily: "Poppins-Bold")),
                      )
               
                ],
              
              ),
            ),
          )
        ],
      ),
    );
  }
}
