import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'forgotPassword.dart';

class LoginFormCard extends StatefulWidget {
  @override
  _LoginFormCardState createState() => _LoginFormCardState();
}

class _LoginFormCardState extends State<LoginFormCard> {
   String name;
  TextEditingController _password = TextEditingController();

    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
   Widget build(BuildContext context) {
    return Form(
      key: _formkey,
          child: Column(
            children: [
              new Container(
        width: double.infinity,
//      height: ScreenUtil.getInstance().setHeight(500),
        padding: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 15.0),
                      blurRadius: 15.0),
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, -10.0),
                      blurRadius: 10.0),
                ]),
        child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Login",
                      style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(45),
                          fontFamily: "Poppins-Bold",
                          letterSpacing: .6)),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Text("Username",
                      style: TextStyle(
                          fontFamily: "Poppins-Medium",
                          fontSize: ScreenUtil.getInstance().setSp(26))),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                 validator: (String value){
                                if(value.isEmpty)
                                {
                                  return 'Please Enter Name';
                                }
                                return null;
                              },
                              onSaved: (String value){
                                name = value;
                              },
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Text("Password",
                      style: TextStyle(
                          fontFamily: "Poppins-Medium",
                          fontSize: ScreenUtil.getInstance().setSp(26))),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                   validator: (String value){
                                if(value.isEmpty)
                                {
                                  return 'Please a Enter Password';
                                }
                                return null;
                              },

                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(35),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                        },
                                              child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.blue,
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(28)),
                        ),
                      ),
                       SizedBox(
                    height: ScreenUtil.getInstance().setHeight(35),
                  ),
                    ],
                  )
                ],
              ),
        ),
      ),
          
         SizedBox(height: ScreenUtil.getInstance().setHeight(40),),
            InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(230),
                          height: ScreenUtil.getInstance().setHeight(80),
                          decoration: BoxDecoration(
                              color: Color(0xFF27AE60),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                  if(_formkey.currentState.validate())
                      {
                        print("successful");

                        return;
                      }else{
                        print("UnSuccessfull");
                      }
                    
                              },
                              child: Center(
                                child: Text("SIGNUP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
          
            ],
          ),
    );
  }

 }


