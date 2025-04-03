import 'package:flutter/material.dart';

import '../consts/colors.dart';
import '../consts/my_texts_style.dart';



class CounterContainer extends StatelessWidget {
  const CounterContainer({super.key, this.onTap1, this.onTap2, required this.text});
  final String text;
 final Function()? onTap1;
  final Function()? onTap2;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap1,
            child: Icon(
              Icons.horizontal_rule_rounded,
              size: 15,
            ),
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: bold.copyWith(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          SizedBox(width: 7),
          GestureDetector(
              onTap: onTap2,
              child: Icon(
                size: 18,
                Icons.add,
                color: blueColor,
              ))
        ],
      ),
    );
  }
}
