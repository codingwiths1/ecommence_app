import 'package:ecommence_app/font_end/consts/colors.dart';
import 'package:ecommence_app/font_end/consts/my_texts_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../back_end/json.dart';
import 'favourite_container.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return favourite.isEmpty
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: whiteColor,
              scrolledUnderElevation: 0,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.maybePop(context);
                  },
                  child: Icon(Icons.arrow_back_ios)),
              title: Text(
                "Favourites",
                style: bold.copyWith(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
            ),
            body: Center(
                child: Text(
              "No item in favourite",
              style: bold.copyWith(color: Colors.black),
            )),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: whiteColor,
              scrolledUnderElevation: 0,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.maybePop(context);
                  },
                  child: Icon(Icons.arrow_back_ios)),
              title: Text(
                "Favourites",
                style: bold.copyWith(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: MasonryGridView.builder(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                itemCount: favourite.length,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return FavouriteContainer(
                    data: favourite[index],
                  );
                },
              ),
            ),
          );
  }
}
