import 'package:amazon_clone/helpers/app_colors.dart';
import 'package:amazon_clone/helpers/app_spacing.dart';
import 'package:amazon_clone/view/user/accounts/widgets/account_top_buttons.dart';
import 'package:amazon_clone/view/user/accounts/widgets/orders_widget.dart';
import 'package:amazon_clone/view/user/accounts/widgets/user_greeting_widget.dart';
import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.1,
                  child: Image.asset("assets/images/amazon_in.png"),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          UserGreetingWidget(),
          AppSpacing.kHeight10,
          AccountTopButtons(),
          AppSpacing.kHeight20,
          OrdersWidget(),
        ],
      ),
    );
  }
}
