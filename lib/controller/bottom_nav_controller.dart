import 'package:amazon_clone/view/accounts/accounts_screen.dart';
import 'package:amazon_clone/view/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Widget> pages = <Widget>[
    const HomeScreen(),
    const AccountsScreen(),
    const Center(child: Text("Cart"))
  ];

  void setIndex(int index) {
    currentIndex.value = index;
  }
}
