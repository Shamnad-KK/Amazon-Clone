import 'package:amazon_clone/helpers/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth_controller.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Get.find<AuthController>().user;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 114, 226, 221),
            Color.fromARGB(255, 162, 236, 223),
          ],
          stops: [0.5, 1.0],
        ),
      ),
      padding: AppPadding.mainPading,
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 20,
          ),
          Expanded(
            child: Text(
              "Delivery to ${user.name} - ${user.address}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_drop_down_outlined,
            size: 18,
          )
        ],
      ),
    );
  }
}
