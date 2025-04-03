import 'package:flutter/material.dart';

class MyContainers extends StatelessWidget {
  const MyContainers(
      {super.key,
      required this.color,
      required this.child,
      this.height = 10,
      this.padding = const EdgeInsets.only(),
      this.margin = const EdgeInsets.only(),
      this.borderColor = Colors.transparent});
  final Color color;
  final Color borderColor;

  final Widget child;
  final double height;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: color)),
      child: child,
    );
  }
}
