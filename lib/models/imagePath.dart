// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ImagePath extends StatelessWidget {
//   final db = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder<QuerySnapshot>(
//             stream: db.collection('recipies').snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 var recipies = snapshot.data.docs;
//                 return ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: recipies.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: Text(recipies[index].get('method')),
//                       );
//                     });
//               } else
//                 return LinearProgressIndicator();
//             }));
//   }
// }
