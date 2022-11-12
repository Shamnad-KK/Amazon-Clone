import 'dart:developer';

import 'package:amazon_clone/controller/bottom_nav_controller.dart';
import 'package:amazon_clone/helpers/app_colors.dart';
import 'package:amazon_clone/helpers/app_widget_sizes.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController bottomNavController = Get.find();
    return Scaffold(
      body: Obx(
        () => bottomNavController.pages[bottomNavController.currentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: AppColors.selectedNavBarColor,
          unselectedItemColor: AppColors.unselectedNavBarColor,
          backgroundColor: AppColors.backgroundColor,
          iconSize: 28,
          items: [
            //Profile
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: AppWidgetSizes.bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: bottomNavController.currentIndex.value == 0
                          ? AppColors.selectedNavBarColor
                          : AppColors.backgroundColor,
                      width: AppWidgetSizes.bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.home_outlined,
                ),
              ),
            ),
            //Account
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: AppWidgetSizes.bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: bottomNavController.currentIndex.value == 1
                          ? AppColors.selectedNavBarColor
                          : AppColors.backgroundColor,
                      width: AppWidgetSizes.bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.person_outline_outlined,
                ),
              ),
            ),
            //Cart
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: AppWidgetSizes.bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: bottomNavController.currentIndex.value == 2
                          ? AppColors.selectedNavBarColor
                          : AppColors.backgroundColor,
                      width: AppWidgetSizes.bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: Badge(
                  elevation: 0,
                  badgeContent: const Text('2'),
                  badgeColor: AppColors.whiteColor,
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
            ),
          ],
          onTap: (value) {
            log(value.toString());
            bottomNavController.setIndex(value);
          },
        ),
      ),
    );
  }
}
