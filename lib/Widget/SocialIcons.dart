import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


  Widget socialicon() {
    return   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     
                          Container(child: Icon(FontAwesomeIcons.facebook,color: Colors.blue, size: 30,)),
                            SizedBox(width: ScreenUtil.getInstance().setWidth(15),
                         ),
                              Container(child: Icon(FontAwesomeIcons.google,color: Colors.redAccent,)),
                              SizedBox(width: ScreenUtil.getInstance().setWidth(15)),
                              Icon(FontAwesomeIcons.twitter,color: Colors.blue, size: 30,),
                    ],
                  );
  }

