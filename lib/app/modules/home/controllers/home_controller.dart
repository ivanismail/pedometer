import 'package:get_storage/get_storage.dart';

import '../../../export.dart';
import '../../../storage.dart';

class HomeController extends GetxController {
  //* PERSONAL SETTING
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  void saveData() async {
    GetStorage().write(XStorage.gender, genderController.text);
    GetStorage().write(XStorage.age, ageController.text);
    GetStorage().write(XStorage.height, heightController.text);
    GetStorage().write(XStorage.weight, heightController.text);

    Get.offAllNamed(Routes.HOME);
  }

  //* PEDOMETER HOME
  String stepCountValue = '0';
  double distance = 0.0;
  double calories = 0.0;
  double weight = 0.0;
  double height = 0.0;

  void loadUserData() async {
    weight = GetStorage().read(XStorage.weight) ?? 0.0;
    height = GetStorage().read(XStorage.height) ?? 0.0;
  }

  // void initPedometer() {
  //   Pedometer pedometer = Pedometer();
  //   pedometer.stepCountStream.listen(onStepCount);
  //   pedometer.pedometerStream.listen(onStepCount);
  // }

  // void onStepCount(int stepCountValue) {
  //   stepCountValue = stepCountValue.toString();
  //   distance = _calculateDistance(stepCountValue);
  //   calories = _calculateCalories(stepCountValue);
  //   update();
  // }

  // double _calculateDistance(int steps) {
  //   double strideLength =
  //       height * 0.415 / 100; // average stride length in meters
  //   return (steps * strideLength) / 1000; // distance in kilometers
  // }

  // double _calculateCalories(int steps) {
  //   return 0.04 * steps * weight; // approximate calories burned
  // }
}
