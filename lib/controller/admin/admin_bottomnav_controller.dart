import 'package:amazon_clone/view/admin/admin_home_screen/admin_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdminBottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;
  List<Widget> pages = [
    const AdminHomeScreen(),
    const Center(child: Text('hy')),
    const Center(child: Text('kuuy')),
  ];

  void setIndex(int newIndex) {
    currentIndex.value = newIndex;
  }
}
