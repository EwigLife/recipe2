import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../explore.dart';
import '../option.dart';

category(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: EdgeInsets.all(15.0),
          content: Container(
            width: 300.0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      CategoryButton(
                        icon: Icon(Icons.food_bank),
                        text: 'Punjabi',
                        navigator: Explore(),
                      ),
                      CategoryButton(
                        icon: Icon(Icons.food_bank),
                        text: 'Punjabi',
                        navigator: Explore(),
                      ),
                      CategoryButton(
                        icon: Icon(Icons.food_bank),
                        text: 'Punjabi',
                        navigator: Explore(),
                      ),
                      CategoryButton(
                        icon: Icon(Icons.food_bank),
                        text: 'Punjabi',
                        navigator: Explore(),
                      ),
                      CategoryButton(
                        icon: Icon(Icons.food_bank),
                        text: 'Punjabi',
                        navigator: Explore(),
                      ),
                      CategoryButton(
                        icon: Icon(Icons.food_bank),
                        text: 'Punjabi',
                        navigator: Explore(),
                      ),
                      CategoryButton(
                        icon: Icon(Icons.food_bank),
                        text: 'Punjabi',
                        navigator: Explore(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

class CategoryButton extends StatelessWidget {
  CategoryButton({this.icon, this.text, this.navigator});

  String text;
  Widget icon;
  Widget navigator;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Row(
        children: [
          icon,
          Text(text),
        ],
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (contex) => navigator));
      },
    );
  }
}
