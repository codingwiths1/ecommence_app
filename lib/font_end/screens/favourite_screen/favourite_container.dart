import 'package:ecommence_app/back_end/json.dart';
import 'package:flutter/material.dart';

import '../../consts/colors.dart';
import '../../consts/my_texts_style.dart';

class FavouriteContainer extends StatefulWidget {
  const FavouriteContainer({super.key, required this.data});
  final Map data;

  @override
  State<FavouriteContainer> createState() => _FavouriteContainerState();
}

class _FavouriteContainerState extends State<FavouriteContainer> {
  @override
  Widget build(BuildContext context) {
    myData.map((items) => FavouriteContainer(data: items));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 200,
          padding: EdgeInsets.all(30),
          height: 200,
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
        SizedBox(height: 10)
      ],
    );
  }
}
