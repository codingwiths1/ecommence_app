import 'package:flutter/material.dart';

import '../cart_screen/cart_list.dart';
import '../home_screen/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
int currentIndex = 0;
  void selectedIndex(int number){
    setState(() {
      currentIndex = number;
    });
  }
  List screens = [
    HomeScreen(),
    CartList(),
    Text("Hi"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(splashFactory: NoSplash.splashFactory,highlightColor: Colors.transparent),
        child: BottomNavigationBar(onTap: selectedIndex,currentIndex: currentIndex,elevation: 10,
            selectedItemColor: Colors.orange[800],
            unselectedItemColor: Colors.grey[800],
            enableFeedback: false,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_rounded), label: "Cart"),BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),


            ]),
      ),
    );
  }
}
