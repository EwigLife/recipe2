import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Constenets/constants.dart';

class Option extends StatefulWidget {
  const Option({
    Key key,
  }) : super(key: key);

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  String text;
  String image;
  int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   setState(() {
      //     widget.optionSelected[index] = !widget.optionSelected[index];
      //   });
      // },
      child: Container(
        height: ScreenUtil.getInstance().setHeight(60),
        decoration: BoxDecoration(
          // color: widget.optionSelected[index] ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(45),
              width: ScreenUtil.getInstance().setWidth(40),
              child: Image.asset(
                image,
                // color: widget.optionSelected[index] ? whitee : blackk,
              ),
            ),
            SizedBox(
              width: ScreenUtil.getInstance().setWidth(8),
            ),
            Text(
              text,
              style: TextStyle(
                // color: widget.optionSelected[index] ? whitee : blackk,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
