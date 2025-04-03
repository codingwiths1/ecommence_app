import 'package:flutter/material.dart';

import 'font_end/screens/bottom_nav_bar_screens/bottom_nav_bar.dart';
import 'font_end/screens/cart_screen/cart_list.dart';
import 'font_end/screens/check_out_screen/check_out_screen.dart';
import 'font_end/screens/favourite_screen/favourite_screen.dart';
import 'font_end/screens/home_screen/home_screen.dart';
import 'font_end/screens/item_info_screen/item_details.dart';
import 'font_end/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/ItemDetails": (context) => ItemDetails(),
        "/CartScreen": (context) => CartList(),
        "/FavouriteScreen": (context) => FavouriteScreen(),
        "/CheckoutScreen":(context)  => CheckOutScreen()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: BottomNavBar(),
    );
  }
}
