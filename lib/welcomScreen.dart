import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe2/Widget/profileImage.dart';
import 'package:recipe2/explore.dart';
import 'package:recipe2/splashScreen.dart';

class Welcom extends StatefulWidget {
  @override
  _WelcomState createState() => _WelcomState();
}

class _WelcomState extends State<Welcom> {
  final db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future getCurrentUser() async {
    final User user = await _auth.currentUser;
    final email = user.email;
    print(email);
    return email.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
            constraints: BoxConstraints.expand(),
            child: Column(children: [
              ProfileImage(),
              StreamBuilder<QuerySnapshot>(
                  stream: db
                      .collection('users')
                      .where('email', isEqualTo: _auth.currentUser.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var user = snapshot.data.docs;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: user.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Column(
                                children: [
                                  Text(
                                    "Hi  ${user[index].get('name')}",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text('Welcom to I Made It',style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),)
                                ],
                              ),
                            );
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
    
            ]),
          ),
       Align(  alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: (){
                  Get.to(Explore());
                },
                              child: Container( 
           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            width: 100,
                      height: 50,
                     
                       
                      decoration: BoxDecoration(
                        
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white24.withOpacity(.3),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0)
                          ]),
                           child: Center(child: Text("Skip",style: TextStyle(
                             fontWeight: FontWeight.bold
                           ),)),),
              ),
                        
    )
        ],
      ),
   );
  }
}
