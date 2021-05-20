import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:recipe2/Services/dbhelper.dart';
import 'package:recipe2/Utils/constants.dart';
import 'package:recipe2/Widget/detail.dart';
import 'package:recipe2/Widget/shared.dart';
import 'package:recipe2/fav/dbhelper.dart';
import 'package:recipe2/fav/favModel.dart';

class RecipiesCard extends StatefulWidget {
  final dynamic likes;

  bool optionSelected = false;
  RecipiesCard({this.likes, this.optionSelected});
  @override
  _RecipiesCardState createState() => _RecipiesCardState();
}

class _RecipiesCardState extends State<RecipiesCard> {
  int likeCount;
  Map likes;
  bool isLiked;
  final dbhelper = Databasehelper.instance;
  Future<List<FavRecipies>> favRecipies;
  var dbHelper;
  String name;
  int curUserId;

  void validate(
    int id,
    String title,
    String carb,
    String dec,
    String imgUrl,
    String ingr,
    String kcal,
    String method,
    String protein,
  ) {
    FavRecipies e =
        FavRecipies(id, title, carb, dec, imgUrl, ingr, kcal, method, protein);
    dbHelper.save(e);
  }

  void queryall() async {
    var allrows = await dbhelper.queryall();
    allrows.forEach((row) {
      print(row);
    });
  }

  void insertdata(
    final String title,
    final String carb,
    final String dec,
    final String imgUrl,
    final String ingr,
    final String kcal,
    final String method,
    final String protein,
  ) async {
    Map<String, dynamic> row = {
      Databasehelper.titleR: title,
      Databasehelper.decR: dec,
      Databasehelper.imgUrlR: imgUrl,
      Databasehelper.kcalR: kcal,
      Databasehelper.carbR: carb,
      Databasehelper.proteinR: protein,
      Databasehelper.ingrR: ingr,
      Databasehelper.methodR: method,
    };
    final id = await dbhelper.insert(row);
    print(id);
  }

  String currentEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map count;
  bool isCount;
  int numberCount = 0;
  var number;
  Future getCurrentUser() async {
    final User user = await _auth.currentUser;
    final email = user.email;
    print(email);
    return email.toString();
  }

  bool isFav = false;

  void fav() {
    setState(() {
      isFav = true ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.optionSelected = false ?? true;
    print("init");
  }

  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: db.collection('recipies').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var recipies = snapshot.data.docs;
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: recipies.length,
                itemBuilder: (context, index) {
                  number = recipies[index].get('views');
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detail(
                                  title: recipies[index].get('title'),
                                  dec: recipies[index].get('dec'),
                                  carb: recipies[index].get('carb'),
                                  imgUrl: recipies[index].get('imgUrl'),
                                  ingr: recipies[index].get('ingr'),
                                  kcal: recipies[index].get('kcal'),
                                  method: recipies[index].get('method'),
                                  protein: recipies[index].get('protein'),
                                   views: recipies[index].get('views'),
                                   id:recipies[index].get('id'),
                                )),
                      );

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [kBoxShadow],
                      ),
                      margin: EdgeInsets.only(
                          right: 16,
                          left: index == 0 ? 16 : 0,
                          bottom: 16,
                          top: 8),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: Hero(
                              tag: recipies[index].get('imgUrl'),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        recipies[index].get('imgUrl'),
                                      ),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          buildRecipeTitle(recipies[index].get('title')),
                          buildTextSubTitleVariation2(
                              recipies[index].get('dec')),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildCalories(
                                    recipies[index].get('kcal') + " Kcal"),
                                Row(
                                  children: [
                                    Text('${number}'),
                                    SizedBox(width: 10),
                                    Icon(Icons.remove_red_eye_rounded),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ]),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return LinearProgressIndicator();
          }
        });
  }
}
  
// Future<bool> removeFavorite(String id, String email) async {
//   try {
//     await _firestore
//         .collection('recipies')
//         .doc(id)
//         .collection("email")
//         .doc(email)
//         .delete();
//     // .set({"status":false});
//     return true;
//   } catch (e) {
//     print(e);
//     return false;
//   }
// }
//
// setState(() {
//   widget.optionSelected =
//       !widget.optionSelected;
//   if (widget.optionSelected) {
//     final String email =
//         _auth.currentUser.email;
//     createFavorite(
//         recipies[index].get('id'), email);
//   } else {
//     final String email =
//         _auth.currentUser.email;
//     removeFavorite(
//         recipies[index].get('id'), email);
//   }
// });
// ignore: unused_label
//    stream: db.collection('recipies').doc(id).snapshots();
//  builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             var recipies = snapshot.data.docs;
//             return ListView.builder(
//                 physics: BouncingScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 itemCount: recipies.length,
//                 itemBuilder: (context, index) {
//                    number=  recipies[index].get('views');
//                 }
//             );
//                 }
//                 };

// setState(() {
//   number++;
// });
//  // GestureDetector(
//   onTap: () => createFavorite(recipies[index].get('id')),
//   //  insertdata(recipies[index].get('title'),  recipies[index].get('carb'), recipies[index].get('dec'), recipies[index].get('imgUrl'), recipies[index].get('ingr'),  recipies[index].get('kcal'), recipies[index].get('method'), recipies[index].get('protein'),),

//   // {
//   //   setState(() {
//   //     widget.optionSelected =
//   //         !widget.optionSelected;
//   //     if (widget.optionSelected) {
//   //       insertdata(recipies[index].get('title'),  recipies[index].get('carb'), recipies[index].get('dec'), recipies[index].get('imgUrl'), recipies[index].get('ingr'),  recipies[index].get('kcal'), recipies[index].get('method'), recipies[index].get('protein'),);
//   //     } else {
//   //       return null;
//   //     }
//   //   });
//   // },
//   child: Container(
//       width: 35,
//       height: 35,
//       child: Icon(Icons.favorite_border)),
// ),
