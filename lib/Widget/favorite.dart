import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe2/Utils/constants.dart';
import 'package:recipe2/Widget/detail.dart';
import 'package:recipe2/Widget/shared.dart';

class FavoriteRecipe extends StatefulWidget {
  
  @override
  _FavoriteRecipeState createState() => _FavoriteRecipeState();
}

class _FavoriteRecipeState extends State< FavoriteRecipe> {
  
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
      appBar: AppBar(title: Text("Favorite"
      
      ),
      backgroundColor: Color(0xFF27AE60),
      ),
            body: SingleChildScrollView(
              child: Container(
                child: StreamBuilder<QuerySnapshot>(
            stream: db.collection('recipies').where('fav.${(_auth.currentUser.email)}',isEqualTo:_auth.currentUser.email).snapshots(),
            builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var recipies = snapshot.data.docs;
                  return GridView.builder(
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                      physics: BouncingScrollPhysics(), 
                      shrinkWrap: true,
                      itemCount: recipies.length,
                      itemBuilder: (context, index) {
                         var fav=recipies[index].get('fav');
                        if(fav = true){
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
                                            fit: BoxFit.cover),
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
                                          Text('${recipies[index].get('views')}'),
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
                         }   });
                } else {
                  return LinearProgressIndicator();
                }
            }),
              ),
       ),
     );
 
  }
}