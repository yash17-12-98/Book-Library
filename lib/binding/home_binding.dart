import 'package:book_library/repository/home_repository.dart';
import 'package:book_library/services/api_service.dart';
import 'package:book_library/services/api_service_impl.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiServiceImpl());
    Get.lazyPut<HomeRepository>(() => HomeRepository(Get.find()));
    Get.put<HomeController>(HomeController(Get.find()));
  }
}
