import 'package:flutter/material.dart';

import '../../../back_end/json.dart';
import '../../consts/colors.dart';
import '../../consts/my_texts_style.dart';
import 'cart_list_container.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  void deleteItem(int index) {
    setState(() {
      cartData.removeAt(index);
    });
  }

  void _increment(int index) {
    setState(() {
      if (cartData[index]["quantity"] < myData[index]["quantity"]) {
        cartData[index]["quantity"] += 1;
      } else {
        print("Cannot add more.  Maximum quantity reached");
      }
    });
  }

  void _decrement(int index) {
    setState(() {
      if (cartData[index]["quantity"] > 1) {
        cartData[index]["quantity"] -= 1;
      } else {
        print("Cannot reduce any further .  Minimum quantity reached");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return cartData.isEmpty
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag_rounded, size: 90, color: darkGrey),
              SizedBox(height: 10),
              Text(
                "No item in your cart",
                style: bold.copyWith(
                    fontSize: 17, fontWeight: FontWeight.w500, color: darkGrey),
              )
            ],
          ))
        : Scaffold(
            body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Cart List", style: bold.copyWith(fontSize: 27)),
                      Icon(
                        Icons.more_vert_rounded,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cartData.length,
                    itemBuilder: (context, index) {
                      return CartContainer(
                        onTap1: () => _decrement(index),
                        onTap2: () => _increment(index),
                        deleteItem: () => deleteItem(index),
                        data: cartData[index],
                        text: '${cartData[index]["quantity"]}',
                      );
                    }),
                GestureDetector(onTap: (){
                  Navigator.pushNamed(context, "/CheckoutScreen");
                },
                  child: Container(padding: EdgeInsets.all(7),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: bOrangeColor),
                    child: Center(
                      child: Text(
                        "Checkout",
                        style: bold.copyWith(
                            fontSize: 19, fontWeight: FontWeight.w500,color: whiteColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ));
  }
}
