import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe2/Utils/constants.dart';
import 'package:recipe2/Widget/detail.dart';
import 'package:recipe2/Widget/shared.dart';

class PopularRecipies extends StatefulWidget {
  @override
  _PopularRecipiesState createState() => _PopularRecipiesState();
}

class _PopularRecipiesState extends State<PopularRecipies> {
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
                  var number= recipies[index].get('views');
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
                                    views: recipies[index].get('views') ,
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
                                        Row(
                                  children: [
                                    Text('${number}'),
                                    SizedBox(width: 10),
                                    Icon(Icons.remove_red_eye_rounded),
                                    SizedBox(width: 10),
                                  ],
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
}