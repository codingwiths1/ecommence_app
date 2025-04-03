import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../back_end/json.dart';
import '../../consts/colors.dart';
import '../../consts/my_texts_style.dart';
import 'home_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void addToCart(Map item) {
    // CupertinoAlertDialog
    int index =
        cartData.indexWhere((cartItems) => cartItems["item"] == item["item"]);
    if (index != -1) {
      if (cartData[index]["quantity"] < item["quantity"]) {
        cartData[index]["quantity"] += 1;
      } else {}
    } else {
      cartData.insert(0, {
        "item": item["item"],
        "price": item["price"],
        "color": item["color"],
        "image": item["image"],
        "quantity": 1
      });
    }
  }

  //
  // //.................MultiFunctions
  // void multiFunction(item) {
  //   isChecked();
  //   addToFavScreen(item);
  //   removeFromFavScreen(index);
  // }
  //
  //...............Favourite Icon
  void isChecked() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  //...............Add To Favourite Screen
  void addToFavScreen(Map item) {
    int index = favourite
        .indexWhere((favouriteItem) => favouriteItem["item"] == item["item"]);

    if (index != -1) {
    } else {
      favourite.add({
        "item": item["item"],
        "image": item["image"],
        "color": item["color"],
      });
    }
  }
  //
  // //.................................Remove From Fav Screen
  void removeFromFavScreen(index) {
    favourite.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 15),

              // Online Shop Row....
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Online Shop",
                    style: bold.copyWith(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 25,
                        color: blackColor,
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.mail_rounded,
                        size: 23,
                        color: blackColor,
                      ),
                      SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/FavouriteScreen");
                        },
                        child: Icon(
                          Icons.favorite,
                          size: 25,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  )
                ],
              ),
            ),

            // Recommendation Row....
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendation",
                    style: bold.copyWith(
                        fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                  Icon(Icons.category_rounded)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MasonryGridView.builder(
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  // Container Column

                  return GestureDetector(
                    onTap: () {
                      int e = myData.indexOf(myData[index]);

                      Navigator.pushNamed(context, "/ItemDetails",
                          arguments: {"index": e});
                    },
                    child: IndexContainers(
                      onTap1: () {
                        isChecked();
                        addToFavScreen(myData[index]);
                        removeFromFavScreen(index);
                      },
                      onTap: () => addToCart(myData[index]),
                      height: 200,
                      width: 200,
                      color: con3,
                      padding: EdgeInsets.all(30),
                      data: myData[index],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
