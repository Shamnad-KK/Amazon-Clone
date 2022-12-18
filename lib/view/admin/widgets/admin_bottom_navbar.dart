import 'dart:developer';

import 'package:amazon_clone/controller/admin/admin_bottomnav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/app_colors.dart';
import '../../../helpers/app_widget_sizes.dart';

class AdminBottomNavBar extends StatelessWidget {
  const AdminBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AdminBottomNavController adminBottomNavController = Get.find();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: AppColors.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.1,
                  child: Image.asset(
                    "assets/images/amazon_in.png",
                    color: AppColors.black,
                  ),
                ),
              ),
              const Text(
                'Admin',
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      body: Obx(
        () => adminBottomNavController
            .pages[adminBottomNavController.currentIndex.value],
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
                      color: adminBottomNavController.currentIndex.value == 0
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
            //Analytics
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: AppWidgetSizes.bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: adminBottomNavController.currentIndex.value == 1
                          ? AppColors.selectedNavBarColor
                          : AppColors.backgroundColor,
                      width: AppWidgetSizes.bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.analytics_outlined,
                ),
              ),
            ),
            //Orders
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: AppWidgetSizes.bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: adminBottomNavController.currentIndex.value == 2
                          ? AppColors.selectedNavBarColor
                          : AppColors.backgroundColor,
                      width: AppWidgetSizes.bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.all_inbox_outlined,
                ),
              ),
            ),
          ],
          onTap: (value) {
            log(value.toString());
            adminBottomNavController.setIndex(value);
          },
        ),
      ),
    );
  }
}
