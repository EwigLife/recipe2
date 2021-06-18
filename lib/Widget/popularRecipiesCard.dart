import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe2/Utils/constants.dart';
import 'package:recipe2/Widget/detail.dart';
import 'package:recipe2/Widget/shared.dart';

class PopularRecipies extends StatefulWidget {
  @override
  _PopularRecipiesState createState() => _PopularRecipiesState();
}

class _PopularRecipiesState extends State<PopularRecipies> {
    final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future getCurrentUser() async {
    
    final User user = await _auth.currentUser;
    final email = user.email;
    print(email);
    return email.toString();
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
                shrinkWrap: true,
                itemCount: recipies.length,
                itemBuilder: (context, index) {
                  var number = recipies[index].get('views');
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
                                    id: recipies[index].get('id'),
                                    views: recipies[index].get('views'),
                                  )),
                        );
                      },
                      child: Container(
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [kBoxShadow],
                          ),
                          child: Row(children: <Widget>[
                            Container(
                              height: 160,
                              width: 150,
                              child: Image.network(
                                recipies[index].get('imgUrl'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buildRecipeTitle(
                                        recipies[index].get('title')),
                                    buildRecipeSubTitle(
                                        recipies[index].get('dec')),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildCalories(
                                            recipies[index].get('kcal') +
                                                " Kcal"),
                                                 SizedBox(width: 10),
                                        Row(
                                          children: [
                                            Text('${number}'),
                                            SizedBox(width: 10),
                                            Icon(Icons.remove_red_eye_rounded),
                                            SizedBox(width: 10),
                                          ],
                                        ),
                                        
                                        Expanded(
                                          child: FlatButton(
                                              onPressed: () {
                                                addFavorite(
                                                    recipies[index].get('id'),
                                                    _auth.currentUser.email);
                                                setState(() {
                                                  if (recipies[index].get(
                                                          'fav.${(_auth.currentUser.email)}') ==
                                                      true) {
                                                    Scaffold.of(context)
                                                        .showSnackBar(
                                                            new SnackBar(
                                                      content: new Text(
                                                          ' Already saved'),
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      margin:
                                                          EdgeInsets.all(10.0),
                                                      duration: const Duration(
                                                          seconds: 2),
                                                      backgroundColor:
                                                          Colors.red,
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                    ));
                                                  }
                                                  if (recipies[index].get(
                                                          'fav.${(_auth.currentUser.email)}') ==
                                                      false) {
                                                    Scaffold.of(context)
                                                        .showSnackBar(
                                                            new SnackBar(
                                                      content: new Text(
                                                          '${(recipies[index].get('title'))} is saved'),
                                                      backgroundColor:
                                                          Color(0xFF27AE60),
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      margin:
                                                          EdgeInsets.all(10.0),
                                                      duration: const Duration(
                                                          seconds: 2),
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                    ));
                                                  }

                                                  // showSnackBar('${(recipies[index].get('title'))} is saved',
                                                  // snackPosition: SnackPosition.BOTTOM,);
                                                });
                                              },
                                              child: Icon(Icons.favorite)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ])));
                });
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
