// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/personal_setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PERSONAL_SETTING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_SETTING,
      page: () => PersonalSettingView(),
      binding: HomeBinding(),
    ),
  ];
}
