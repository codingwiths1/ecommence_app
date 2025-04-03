import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  final Function()? onTap;
  final Color backGround;
  final Color borderRound;
  final Widget child;
  final EdgeInsetsGeometry padding;

  const ButtonContainer(
      {super.key,
      this.backGround = Colors.transparent,
      this.borderRound = Colors.transparent,
      required this.child,
      this.padding = const EdgeInsets.only(),  this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
            color: backGround,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2, color: borderRound)),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
