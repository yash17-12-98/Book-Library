import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../binding/binding.dart';
import '../resources/resources.dart';
import 'app_constant.dart';
import 'pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstant.project,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      defaultTransition: Transition.rightToLeft,
      initialRoute: Routes.homeRoute,
      initialBinding: HomeBinding(),
      getPages: pages,
    );
  }
}
