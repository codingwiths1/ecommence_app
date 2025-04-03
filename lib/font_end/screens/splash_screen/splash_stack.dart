

import 'package:ecommence_app/font_end/screens/splash_screen/splash_containers.dart';
import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class SplashStack extends StatelessWidget {
  const SplashStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: -80,
        right: 20,
        child: MyContainers(
          height: 250,
          color: con4,
          padding: EdgeInsets.all(30),
          child: Image.asset("images/image (3).png"),
        ),
      ),
      Positioned(
        left: -33,
        top: 40,
        child: MyContainers(
          height: 250,
          color: con3,
          padding: EdgeInsets.all(30),
          child: Image.asset("images/image (5).png"),
        ),
      ),
      Positioned(
        left: -30,
        top: 320,
        child: MyContainers(
          height: 170,
          color: con2,
          padding: EdgeInsets.all(30),
          child: Image.asset("images/image (4).png"),
        ),
      ),
      Positioned(
        right: -20,
        top: 200,
        child: MyContainers(
          height: 300,
          color: con1,
          padding: EdgeInsets.all(30),
          child: Image.asset("images/image (2).png"),
        ),
      ),
    ]);
  }
}
