import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:recipe2/Services/database.dart';
import 'package:recipe2/Utils/constants.dart';
import 'package:recipe2/controllers/userController.dart';
import '../explore.dart';

class ProfileImage extends StatefulWidget {
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File _image;
  String imagUrl = Get.find<UserController>().user.imagUrl;
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future getCurrentUser() async {
    final User user = await _auth.currentUser;
    final email = user.email;
    print(email);
    return email.toString();
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
      print('Image Path $image');

      uploadPic();
    });
  }

  Future uploadPic() async {
    String fileName = basename(_image.path);

    Reference storageReference =
        FirebaseStorage.instance.ref('users/$fileName');
    UploadTask uploadTask = storageReference.putFile(_image);
    TaskSnapshot taskSnapshot =
        await uploadTask.whenComplete(() => print('Picture Uploaded'));
    imagUrl = await taskSnapshot.ref.getDownloadURL();
    await Database().updateProfilePic(imagUrl.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // padding: EdgeInsets.all(30),
      // color: Color(0xFF27AE60),
      child: Center(
          child: Column(children: [
        new Stack(fit: StackFit.loose, children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 170.0,
                width: 130.0,
                child: showimg(),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 110.0, right: 90.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new CircleAvatar(
                    backgroundColor: Colors.black38,
                    radius: 20.0,
                    child: InkWell(
                      onTap: () async {
                        getImageFromGallery();
                      },
                      child: new Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              )),
        ]),
      ])),
    );
    
  }

  Widget showimg() {
    return StreamBuilder<QuerySnapshot>(
        stream: db
            .collection('users')
            .where('id', isEqualTo: _auth.currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var user = snapshot.data.docs;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: user.length,
                itemBuilder: (context, index) {
                  var imag = user[index].get('imageUrl');
                  if (imag != null) {
                    return ClipOval(
                      child: Image.network(
                        user[index].get('imageUrl'),
                        width: (150),
                        height: (120),
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return ClipOval(
                        child: Image.asset(
                      "assets/images/food.jpg",
                      width: (150),
                      height: (120),
                      fit: BoxFit.cover,
                    ));
                  }
                });
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
