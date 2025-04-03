


import 'package:flutter/material.dart';

import '../../../back_end/json.dart';
import '../../consts/colors.dart';
import '../../consts/my_texts_style.dart';
import '../../re_usable_widgets/counter_container.dart';

class CartContainer extends StatelessWidget {
  final void Function()? deleteItem;
  final Map data;
  final String text;
  final Function()? onTap1;
  final Function()? onTap2;
  const CartContainer({super.key, required this.data, this.deleteItem, required this.text, this.onTap1, this.onTap2});

  @override
  Widget build(BuildContext context) {
    cartData.map((e) => CartContainer(data: e, text: '',));
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: bgColors),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: data["color"] ?? con3,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(data["image"]),
          ),
          SizedBox(width: 13),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              data["item"],
                              style: bold.copyWith(
                                  fontSize: 19, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // .....................................Item Price
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(data["price"],
                              style: bold.copyWith(
                                  fontSize: 27, color: orangeColor)),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      // .....................................Item Counter Button

                      CounterContainer(text: text,onTap1: onTap1,onTap2: onTap2,),
                    ]),
                    // .....................................Item Delete
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: deleteItem,
                            icon: Icon(Icons.delete_forever_outlined))
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
