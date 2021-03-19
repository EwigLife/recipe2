import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpFormCard extends StatefulWidget {
  @override
  _SignUpFormCardState createState() => _SignUpFormCardState();
}

class _SignUpFormCardState extends State<SignUpFormCard> {
  String name,email;
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
   Widget build(BuildContext context) {
    return Form(
      key: _formkey,
          child: Column(
            children: [
              new Container(
        width: double.infinity,
  // height: ScreenUtil.getInstance().setHeight(800),
        padding: EdgeInsets.only(top:10,bottom: 0),
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
                  Text("SignUp",
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
                  Text("Email",
                      style: TextStyle(
                          fontFamily: "Poppins-Medium",
                          fontSize: ScreenUtil.getInstance().setSp(26))),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email@...com",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                    validator: (String value){
                          if(value.isEmpty)
                          {
                            return 'Please a Enter';
                          }
                          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                            return 'Please a valid Email';
                          }
                          return null;
                        },
                        onSaved: (String value){
                          email = value;
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
                       controller: _password,
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
                  Text("Confirm Password",
                      style: TextStyle(
                          fontFamily: "Poppins-Medium",
                          fontSize: ScreenUtil.getInstance().setSp(26))),
                  TextFormField(
                    controller: _confirmpassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                   validator: (String value){
                          if(value.isEmpty)
                          {
                            return 'Please re-enter password';
                          }
                          print(_password.text);

                          print(_confirmpassword.text);

                          if(_password.text!=_confirmpassword.text){
                            return "Password does not match";
                          }

                          return null;
                        },
                  ),
                ],
              ),
        ),
      ), SizedBox(height: ScreenUtil.getInstance().setHeight(30),),
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
