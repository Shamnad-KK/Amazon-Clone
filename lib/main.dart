import 'package:amazon_clone/helpers/app_colors.dart';
import 'package:amazon_clone/helpers/init_controller.dart';
import 'package:amazon_clone/routes/route_names.dart';
import 'package:amazon_clone/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Amazon Clone',
      initialBinding: InitDependencies(),
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: AppColors.secondaryColor),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: AppColors.appbarIconColor,
            ),
          )),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.getAppRoutes(),
      initialRoute: RouteNames.splashScreen,
    );
  }
}
