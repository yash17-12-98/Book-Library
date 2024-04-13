import 'package:get/get.dart';

class BaseController extends GetxController {
  Rx<AppState> appState = AppState.initial.obs;
}

enum AppState { initial, loading, complete }
