import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe2/Widget/about.dart';
 File imageURI;
class ProfileImage extends StatefulWidget {
  @override
  _ProfileImageState createState() => _ProfileImageState();
}
class _ProfileImageState extends State<ProfileImage> {
 
  Future getImageFromGallery() async {
    // ignore: deprecated_member_use

    final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURI = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30),
      color: Color(0xFF27AE60),
      child: Center(
          child: Column(children: [
        new Stack(fit: StackFit.loose, children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              imageURI == null
                  ? Container(
                      width: ScreenUtil.getInstance().setWidth(250),
                      height: ScreenUtil.getInstance().setHeight(220),
                      child: ClipOval(
                        child: Column(children: [
                          Expanded(
                            child: Image.asset(
                              "assets/images/food.jpg",
                              fit: BoxFit.cover,
                              width: ScreenUtil.getInstance().setWidth(250),
                              height: ScreenUtil.getInstance().setHeight(220),
                            ),
                          ),
                        ]),
                      ),
                    )
                  : Container(
                      width: ScreenUtil.getInstance().setWidth(250),
                      height: ScreenUtil.getInstance().setHeight(220),
                      child: ClipOval(
                        child: Column(children: [
                          Container(
                            child: Expanded(
                              child: Image.file(
                                imageURI,
                                width: ScreenUtil.getInstance().setWidth(250),
                                height: ScreenUtil.getInstance().setHeight(220),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ]),
                      ),
                    )
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 90.0, right: 90.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new CircleAvatar(
                    backgroundColor: Colors.black38,
                    radius: 20.0,
                    child: InkWell(
                      onTap: () => getImageFromGallery(),
                      child: new Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )),
        ]),
      ])),
    );
  }
}
