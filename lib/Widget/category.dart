import 'package:flutter/material.dart';
import 'package:recipe2/category/exploreCategory.dart';
import 'package:recipe2/welcomScreen.dart';
import '../explore.dart';

category(context) {
  
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.all(10.0),
              content: Container(
                height: 300,
                child: SingleChildScrollView(
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      CategoryButton(
                        image: "assets/images/beef.png",
                        text: 'Beef',
                        navigator: ExploreCategory(
                          title: 'beef',
                        ),
                      ),
                      SizedBox(width: 10),
                      CategoryButton(
                        image: "assets/images/cacke.png",
                        text: 'Cake',
                        navigator: ExploreCategory(
                          title: 'cake',
                        ),
                      ),
                      SizedBox(width: 10),
                      CategoryButton(
                        image: "assets/images/chicken.ico",
                        text: 'Chicken',
                        navigator:ExploreCategory(
                          title: 'chicken',
                        ),
                      ),
                      SizedBox(width: 10),
                      CategoryButton(
                        image: "assets/images/fastfood.png",
                        text: 'Fast Food',
                        navigator: ExploreCategory(
                          title: 'fast food',
                        ),
                      ),
                      SizedBox(width: 10),
                      CategoryButton(
                        image: "assets/images/noodels.png",
                        text: 'Noodels',
                        navigator: ExploreCategory(
                          title: 'noodels',
                        ),
                      ),
                     
                      SizedBox(width: 10),
                      CategoryButton(
                        image: "assets/images/rice.png",
                        text: 'Rice',
                        navigator: ExploreCategory(
                          title: 'rice',
                        ),
                      ),
                      SizedBox(width: 10),
                      CategoryButton(
                        image: "assets/images/sweet.png",
                        text: 'Sweet',
                        navigator:ExploreCategory(
                          title: 'sweet',
                        ),
                      ),
                      SizedBox(width: 10),
                      CategoryButton(
                        image: "assets/images/tea.png",
                        text: 'Tea',
                        navigator:ExploreCategory(
                          title: 'tea',
                        ),
                      ),
                      SizedBox(width: 10),
                      CategoryButton(
                        image: "assets/images/vegetable.png",
                        text: 'Vegetable',
                        navigator: ExploreCategory(
                          title: 'vegetable',
                        ),
                      ),
                       SizedBox(width: 10),
                      CategoryButton(
                        image: "assets/images/other.png",
                        text: 'Other',
                        navigator: ExploreCategory(
                          title: 'other',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
// this is 
class CategoryButton extends StatelessWidget {
  CategoryButton({this.text, this.image, this.navigator});
  String image;
  String text;
  Widget icon;
  Widget navigator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2.9,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF6078ea).withOpacity(.3),
                    offset: Offset(0.0, 8.0),
                    blurRadius: 8.0)
              ]),
          child: MaterialButton(
            child: Row(
              children: [
                ClipOval(
                  child: Column(children: [
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: (29),
                      height: (30),
                    ),
                  ]),
                ),
                SizedBox(width: 3),
                Text(text),
              ],
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (contex) => navigator));
            },
          ),
        ),
      ],
    );
  }
}
