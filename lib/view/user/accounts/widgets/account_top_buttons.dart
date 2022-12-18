import 'package:flutter/cupertino.dart';

import 'account_buttons.dart';

class AccountTopButtons extends StatelessWidget {
  const AccountTopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              title: 'Your Orders',
              onTap: () {},
            ),
            AccountButton(
              title: 'Turn Seller',
              onTap: () {},
            )
          ],
        ),
        Row(
          children: [
            AccountButton(
              title: 'Log Out',
              onTap: () {},
            ),
            AccountButton(
              title: 'Your Wish List',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
