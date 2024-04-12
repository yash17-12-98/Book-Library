import 'package:get/get.dart';

import '../binding/binding.dart';
import '../resources/resources.dart';
import '../view/view.dart';

List<GetPage> pages = [
  GetPage(
    name: Routes.homeRoute,
    page: () => const Home(),
    binding: HomeBinding(),
  )
];
