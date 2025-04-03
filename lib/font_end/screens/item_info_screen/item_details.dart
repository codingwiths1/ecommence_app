
import 'package:flutter/material.dart';

import '../../../back_end/json.dart';
import '../../consts/colors.dart';
import '../../consts/my_texts_style.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int currentIndex = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arg = ModalRoute.of(context)!.settings.arguments as Map;
    currentIndex = arg["index"];
  }

  void addToCart(Map item) {
    // CupertinoAlertDialog
    int index =
    cartData.indexWhere((cartItems) => cartItems["item"] == item["item"]);
    if (index != -1  ) {
      if (cartData[index]["quantity"] < item["quantity"]){
        cartData[index]["quantity"] += 1;}else{}
    }

    else {
      cartData.insert(0, {
        "item": item["item"],
        "price": item["price"],
        "color": item["color"],
        "image": item["image"],
        "quantity": 1
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.maybePop(context);
                          },
                          child: Icon(Icons.arrow_back_ios)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Detail",
                        style: bold.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/CartScreen");
                        },
                        icon: Icon(Icons.shopping_bag_outlined),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 370,
              width: 370,
              decoration: BoxDecoration(
                  color: myData[currentIndex]["color"] ?? con3,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      width: 40, color: myData[currentIndex]["color"] ?? con3)),
              child: Image.asset(myData[currentIndex]["image"]),
            ),
            SizedBox(height: 30),

            // Details Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(myData[currentIndex]["item"],
                          style: bold.copyWith(
                              fontSize: 22, fontWeight: FontWeight.w500)),
                      SizedBox(height: 10),
                      Text(myData[currentIndex]["price"],
                          style: bold.copyWith(
                              fontSize: 40,
                              color: orangeColor,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [],
                  ),
                )
              ],
            ),
            SizedBox(height: 15),

            Text(
              myData[currentIndex]["description"],
              style: bold.copyWith(fontWeight: FontWeight.w400, fontSize: 17),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => addToCart(myData[currentIndex]),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: bOrangeColor),
                      child: Center(
                          child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
