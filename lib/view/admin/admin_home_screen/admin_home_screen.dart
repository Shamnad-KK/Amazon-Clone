import 'package:amazon_clone/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/app_colors.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed(RouteNames.addProductScreen);
        },
        tooltip: 'Add Product',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
