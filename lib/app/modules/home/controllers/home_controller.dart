import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:pedometer/pedometer.dart';

import '../../../export.dart';
import '../../../storage.dart';
import '../../../utils.dart';

class HomeController extends GetxController {
  //* PERSONAL SETTING
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  Future<void> saveData() async {
    GetStorage().write(XStorage.gender, genderController.text);
    GetStorage().write(XStorage.age, ageController.text);
    GetStorage().write(XStorage.height, heightController.text);
    GetStorage().write(XStorage.weight, weightController.text);

    Get.offAllNamed(Routes.HOME);
    return Future.value();
  }

  //* PEDOMETER HOME
  late Stream<StepCount> stepCountStream;
  late Stream<PedestrianStatus> pedestrianStatusStream;
  String statusPedo = '?', stepsCount = '?';
  String stepCountValue = '0';
  double distance = 0.0;
  double calories = 0.0;
  double weight = 0.0;
  double height = 0.0;

  Future initHome() async {
    if (!checkToken()) {
      Get.offAllNamed(Routes.PERSONAL_SETTING);
    }
    loadUserData();
    initPlatformState();
  }

  void loadUserData() async {
    weight = GetStorage().read(XStorage.weight) != null
        ? double.parse(GetStorage().read(XStorage.weight))
        : 0.0;
    height = GetStorage().read(XStorage.height) != null
        ? double.parse(GetStorage().read(XStorage.height))
        : 0.0;
    update();
  }

  void onStepCount(StepCount event) {
    stepsCount = event.steps.toString();

    distance = _calculateDistance(event.steps);
    calories = _calculateCalories(event.steps);
    update();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    statusPedo = event.status;
    update();
  }

  void onPedestrianStatusError(error) {
    log('onPedestrianStatusError: $error');

    statusPedo = 'Pedestrian Status not available';
  }

  void onStepCountError(error) {
    log('onStepCountError: $error');

    stepsCount = 'Step Count not available';
  }

  void initPlatformState() {
    pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    stepCountStream = Pedometer.stepCountStream;
    stepCountStream.listen(onStepCount).onError(onStepCountError);

    // if (!mounted) return;
  }

  // void initPedometer() {
  //   Pedometer pedometer = Pedometer();
  //   pedometer.stepCountStream.listen(onStepCount);
  //   pedometer.pedometerStream.listen(onStepCount);
  // }

  double _calculateDistance(int steps) {
    double strideLength = 165 * 0.415 / 100; // average stride length in meters
    return (steps * strideLength) / 1000; // distance in kilometers
  }

  double _calculateCalories(int steps) {
    return (0.04 * steps * weight) / 10; // approximate calories burned
  }
}
