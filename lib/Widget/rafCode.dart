//  Container(
//     height: 40,
//     width: 40,
//     child: heart(
//       recipies[index].get('id'),
//     )
// Icon(Icons.favorite_border),
// StreamBuilder<DocumentSnapshot>(
//   stream: db.collection("recipes").doc(recipies[index].id).snapshots(),
//   builder: (context,snapshot){
//     if(snapshot.hasData){
//       var docs = snapshot.data;
//       if(docs.get("fav.${(_auth.currentUser.email)}")==true){
//         print('favertite ::::::::::');
//       }
//     } else {
//       print('************* no favt');
//     }
//   },
// ),
// ),

// child: heart(),),
// if(recipies[index].get(
//             'fav.${(_auth.currentUser.email)}') ==
//         true){Icon(Icons.favorite)),}
//         else{
//           Icon(Icons.favorite_border)

//   heart(String id) {
//     bool cheak;

//     return Expanded(
//       child: Container(
//         height: 50,
//         width: 50,
//         child: StreamBuilder<QuerySnapshot>(
//             stream: db
//                 .collection('recipies')
//                 .where('fav.${(_auth.currentUser.email)}', isEqualTo: true)
//                 .snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 var recipies = snapshot.data.docs;
//                 return ListView.builder(
//                     // physics: BouncingScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: recipies.length,
//                     itemBuilder: (context, index) {

//                       if (recipies[index].get("id") == id) {
//                         return Container(
//                             height: 50,
//                             width: 50,
//                             child: Icon(Icons.favorite, color: Colors.red));
//                       } else {
//                         Container(
//                           height: 50,
//                           width: 50,
//                           child: Icon(
//                             Icons.favorite,
//                             color: Colors.black,
//                           ),
//                         );
//                       }
//                     });
//               } else {
//                 Icon(
//                   Icons.favorite,
//                   color: Colors.black,
//                 );
//               }
//             }),
//       ),
//     );
//   }
// }

// Future<bool> removeFavorite(String id, String email) async {
//   try {
//     await _firestore
//         .collection('recipies')
//         .doc(id)
//         .collection(id)
//         .update({"fav.${(email)}" :true});
//         // .delete();
//     // .set({"status":false});
//     return true;
//   } catch (e) {
//     print(e);
//     return false;
//   }
// }

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
