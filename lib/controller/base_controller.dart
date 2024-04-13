import 'package:book_library/app/enum.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  Rx<AppState> appState = AppState.initial.obs;
}
