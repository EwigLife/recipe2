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
  @override
  _RecipiesCardState createState() => _RecipiesCardState();
}

class _RecipiesCardState extends State<RecipiesCard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool check = false;
  var number;

  Future getCurrentUser() async {
    final User user = await _auth.currentUser;
    final email = user.email;
    print(email);
    return email.toString();
  }

  @override
  void initState() {
    super.initState();
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

                  try {
                    if (recipies[index]
                            .get('fav.${(_auth.currentUser.email)}') ==
                        true) {
                      check = true;
                    }
                    if (recipies[index]
                            .get('fav.${(_auth.currentUser.email)}') ==
                        false) {
                      check = false;
                    }
                  } catch (e) {
                    check = false;
                  }

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
                                  id: recipies[index].get('id'),
                                )),
                      );
                    },
                    child: Expanded(
                      child: Container(
                        height: 200,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildCalories(
                                      recipies[index].get('kcal') + " Kcal"),
                                  SizedBox(width: 5),
                                  Row(
                                    children: [
                                      Text('${number}'),
                                      SizedBox(width: 5),
                                      Icon(Icons.remove_red_eye_rounded),
                                      SizedBox(width: 5),
                                    ],
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                        onPressed: () {
                                          addFavorite(recipies[index].get('id'),
                                              _auth.currentUser.email);
                                          setState(() {
                                            if (recipies[index].get(
                                                    'fav.${(_auth.currentUser.email)}') ==
                                                true) {
                                              Scaffold.of(context)
                                                  .showSnackBar(new SnackBar(
                                                content:
                                                    new Text(' Already saved'),
                                                padding: EdgeInsets.all(10.0),
                                                margin: EdgeInsets.all(10.0),
                                                duration:
                                                    const Duration(seconds: 2),
                                                backgroundColor: Colors.red,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                              ));
                                            }
                                            if (recipies[index].get(
                                                    'fav.${(_auth.currentUser.email)}') ==
                                                false) {
                                              Scaffold.of(context)
                                                  .showSnackBar(new SnackBar(
                                                content: new Text(
                                                    '${(recipies[index].get('title'))} is saved'),
                                                backgroundColor:
                                                    Color(0xFF27AE60),
                                                padding: EdgeInsets.all(10.0),
                                                margin: EdgeInsets.all(10.0),
                                                duration:
                                                    const Duration(seconds: 2),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                              ));
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.favorite,
                                          color:
                                              check ? Colors.red : Colors.black,
                                        )),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return LinearProgressIndicator();
          }
        });
  }

  Future<bool> addFavorite(String id, String email) async {
    try {
      await _firestore.collection('recipies').doc(id)
          // .collection(id)
          .update({"fav.${(email)}": true});
      // .delete();
      // .set({"status":false});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
