


import 'package:flutter/material.dart';

import '../../consts/colors.dart';
import '../../consts/my_texts_style.dart';
import '../../re_usable_widgets/button_container.dart';

class SplashColumn extends StatelessWidget {
  const SplashColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Discover the\nfinest collection",
        style: bold.copyWith(fontSize: 35),
      ),
      Text(
        "Handpicked pieces crafted to perfection\njust for you,quality,style, and elegance\nand all in one place",
        style: bold.copyWith(fontSize: 18, fontWeight: FontWeight.w400),
      ),
      SizedBox(height: 25),
      Row(
        children: [
          Expanded(
            child: ButtonContainer(
              padding: EdgeInsets.symmetric(vertical: 8),
              borderRound: orangeColor,
              child: Text(
                "Log in",
                style: bold.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ButtonContainer(
              padding: EdgeInsets.symmetric(vertical: 8),
              backGround: orangeColor,
              child: Text(
                "Register",
                style: bold.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: whiteColor),
              ),
            ),
          )
        ],
      )
    ]);
  }
}
