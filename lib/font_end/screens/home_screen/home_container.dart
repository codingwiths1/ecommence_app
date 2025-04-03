import 'package:flutter/material.dart';

import '../../../back_end/json.dart';
import '../../consts/colors.dart';
import '../../consts/my_texts_style.dart';
import '../../re_usable_widgets/button_container.dart';

class IndexContainers extends StatefulWidget {
  final Function()? onTap;
  final Function()? onTap1;

  final Map data;
  const IndexContainers({
    super.key,
    this.color = Colors.white,
    // required this.child,
    this.height = 10,
    this.padding = const EdgeInsets.only(),
    this.margin = const EdgeInsets.only(),
    required this.data,
    this.width = 10,
    this.onTap,
    this.onTap1,
  });
  final Color color;

  // final Widget child;
  final double height;
  final double width;

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  @override
  State<IndexContainers> createState() => _IndexContainersState();
}

class _IndexContainersState extends State<IndexContainers> {

  @override
  Widget build(BuildContext context) {
    myData.map((e) => IndexContainers(color: widget.color, data: e));
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: widget.width,
            padding: widget.padding,
            margin: widget.margin,
            height: widget.height,
            decoration: BoxDecoration(
                color: widget.data["color"] ?? con3,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(widget.data["image"]),
          ),
          SizedBox(
            height: 15,
          ),
          Text(widget.data["item"],
              style: bold.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.data["price"],
                  style: bold.copyWith(fontSize: 30, color: orangeColor)),
              ButtonContainer(
                  onTap: widget.onTap,
                  backGround: blackColor,
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.add,
                    color: whiteColor,
                  ))
            ],
          ),
          SizedBox(height: 10)
        ],
      ),
      Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: widget.onTap1,
            child: Icon(
              isClicked == false
                  ? Icons.favorite_border_outlined
                  : Icons.favorite_rounded,
              color: orangeColor,
              size: 30,
            ),
          ))
    ]);
  }
}
